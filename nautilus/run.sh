#!/bin/bash
# Submit SOFA-orfs Bazel builds as Kubernetes Jobs on NRP Nautilus.
#
# Usage:
#   ./nautilus/run.sh [design]              # run full flow for one variant
#   ./nautilus/run.sh                       # run all three variants
#   ./nautilus/run.sh --stage synth         # run only synthesis for all variants
#   ./nautilus/run.sh sofa_hd --stage route # run only routing for sofa_hd
#   ./nautilus/run.sh --status              # show job status
#   ./nautilus/run.sh --delete              # delete all sofa-orfs jobs
#   ./nautilus/run.sh --delete sofa_hd      # delete jobs for one variant
#
# Options:
#   --branch BRANCH      Git branch to clone (default: current branch)
#   --stage STAGE        bazel-orfs stage target suffix:
#                          synth|floorplan|place|cts|grt|route|final
#                          (default: final — full flow end-to-end)
#   --save-artifacts     Copy bazel-bin outputs to the sofa-orfs-artifacts PVC
#   --repo URL           Git repo URL (default: auto-detected from git remote)
#   --namespace NS       Kubernetes namespace (default: value in KUBECONFIG context)
#   --cpu NUM            Override CPU request (default: from design_resources.conf)
#   --mem SIZE           Override memory request, e.g. 96Gi
#   --dry-run            Print generated YAML without submitting
#   --status             Show status of submitted jobs
#   --delete             Delete jobs (filtered by optional design arg)
#
# Bazel targets built:
#   //designs/<design>:<design>_<stage>
#   e.g. //designs/sofa_hd:sofa_hd_final
#
# Prerequisites:
#   - kubectl configured with access to NRP Nautilus and your namespace
#   - PVC named sofa-orfs-artifacts created in your namespace
#   - Generated RTL committed to the repo (see nautilus/README.md)
#   - bazel-orfs submodule committed (git submodule add already done)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE="$SCRIPT_DIR/job-template.yaml"
RESOURCES_CONF="$SCRIPT_DIR/design_resources.conf"

ALL_DESIGNS=(sofa_hd qlsofa_hd sofa_chd)

# Defaults
BRANCH="$(git -C "$REPO_DIR" rev-parse --abbrev-ref HEAD 2>/dev/null || echo main)"
STAGE="final"
SAVE_ARTIFACTS="false"
REPO_URL="$(git -C "$REPO_DIR" remote get-url origin 2>/dev/null || echo '')"
NAMESPACE="$(kubectl config view --minify -o jsonpath='{.contexts[0].context.namespace}' 2>/dev/null || echo '')"
CLI_CPU=""
CLI_MEM=""
DRY_RUN=false
MODE="submit"
FILTER_DESIGN=""

read_resource() {
  local key="$1" design="$2" fallback="$3"
  if [[ -f "$RESOURCES_CONF" ]]; then
    local val
    for tag in "$design" defaults; do
      val=$(awk -v t="$tag" -v k="$key" '
        $1==t { for(i=2;i<=NF;i++){n=split($i,a,"="); if(n==2&&a[1]==k){print a[2];exit}} }
      ' "$RESOURCES_CONF")
      [[ -n "$val" ]] && { echo "$val"; return; }
    done
  fi
  echo "$fallback"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --branch)        BRANCH="$2"; shift 2 ;;
    --stage)         STAGE="$2"; shift 2 ;;
    --save-artifacts) SAVE_ARTIFACTS=true; shift ;;
    --repo)          REPO_URL="$2"; shift 2 ;;
    --namespace)     NAMESPACE="$2"; shift 2 ;;
    --cpu)           CLI_CPU="$2"; shift 2 ;;
    --mem)           CLI_MEM="$2"; shift 2 ;;
    --dry-run)       DRY_RUN=true; shift ;;
    --status)        MODE="status"; shift ;;
    --delete)        MODE="delete"; shift ;;
    -h|--help)       sed -n '2,/^$/s/^# //p' "$0"; exit 0 ;;
    -*)              echo "ERROR: unknown flag $1" >&2; exit 1 ;;
    *)
      if [[ -z "$FILTER_DESIGN" ]]; then FILTER_DESIGN="$1"
      else echo "ERROR: unexpected argument: $1" >&2; exit 1
      fi
      shift ;;
  esac
done

if [[ -z "$NAMESPACE" ]]; then
  echo "ERROR: could not detect namespace. Set one with --namespace NS or configure kubectl context." >&2
  exit 1
fi

if [[ -z "$REPO_URL" ]]; then
  echo "ERROR: could not detect git remote URL. Set one with --repo URL." >&2
  exit 1
fi

USER_LABEL=$(echo "${USER:-sofa}" | tr '[:upper:]' '[:lower:]')

bazel_target_for() {
  local design="$1"
  echo "//designs/${design}:${design}_${STAGE}"
}

job_name_for() {
  local design="$1"
  echo "${USER_LABEL}-sofa-${design}-${STAGE}" \
    | tr '[:upper:]' '[:lower:]' | tr '_' '-' | cut -c1-63
}

# Status mode
if [[ "$MODE" == "status" ]]; then
  echo "Jobs in $NAMESPACE (user: $USER_LABEL):"
  kubectl get jobs -n "$NAMESPACE" -l "app=sofa-orfs,user=$USER_LABEL" \
    -o custom-columns='NAME:.metadata.name,STATUS:.status.conditions[0].type,DONE:.status.succeeded,FAIL:.status.failed,AGE:.metadata.creationTimestamp' \
    2>/dev/null || true
  echo ""
  kubectl get pods -n "$NAMESPACE" -l "app=sofa-orfs,user=$USER_LABEL" \
    -o custom-columns='POD:.metadata.name,PHASE:.status.phase,NODE:.spec.nodeName' \
    2>/dev/null || true
  exit 0
fi

# Delete mode
if [[ "$MODE" == "delete" ]]; then
  SELECTOR="app=sofa-orfs,user=$USER_LABEL"
  [[ -n "$FILTER_DESIGN" ]] && SELECTOR="$SELECTOR,design=$(echo "$FILTER_DESIGN" | tr '_' '-')"
  matched=$(kubectl get jobs -n "$NAMESPACE" -l "$SELECTOR" -o name 2>/dev/null | wc -l)
  if [[ "$matched" -eq 0 ]]; then
    echo "No matching jobs found (selector: $SELECTOR)."
    exit 0
  fi
  kubectl delete jobs -n "$NAMESPACE" -l "$SELECTOR"
  exit 0
fi

# Collect designs to submit
DESIGNS=()
for d in "${ALL_DESIGNS[@]}"; do
  [[ -n "$FILTER_DESIGN" && "$d" != "$FILTER_DESIGN" ]] && continue
  DESIGNS+=("$d")
done

if [[ ${#DESIGNS[@]} -eq 0 ]]; then
  echo "No designs matched: ${FILTER_DESIGN:-<all>}" >&2
  exit 1
fi

echo "Designs to submit (${#DESIGNS[@]}):"
for d in "${DESIGNS[@]}"; do
  echo "  $(bazel_target_for "$d")"
done
echo "  Branch: $BRANCH"
echo "  Namespace: $NAMESPACE"
echo ""

if [[ "$DRY_RUN" == false && ${#DESIGNS[@]} -gt 1 ]]; then
  read -r -p "Submit ${#DESIGNS[@]} jobs to $NAMESPACE? [y/N] " reply || reply=""
  [[ "$reply" =~ ^[yY] ]] || { echo "Aborted."; exit 1; }
fi

for design in "${DESIGNS[@]}"; do
  job_name=$(job_name_for "$design")
  bazel_target=$(bazel_target_for "$design")

  if [[ -n "$CLI_CPU" ]]; then
    cpu_req="$CLI_CPU"
    cpu_lim="$((CLI_CPU * 2))"
  else
    cpu_req=$(read_resource cpu_req "$design" 8)
    cpu_lim=$(read_resource cpu_lim "$design" "$((cpu_req * 2))")
  fi

  if [[ -n "$CLI_MEM" ]]; then
    mem_req="$CLI_MEM"
    mem_num="${CLI_MEM%Gi}"
    mem_lim="$((mem_num * 2))Gi"
  else
    mem_req=$(read_resource mem_req "$design" 64Gi)
    mem_num="${mem_req%Gi}"
    mem_lim=$(read_resource mem_lim "$design" "$((mem_num * 2))Gi")
  fi

  eph_req=$(read_resource eph_req "$design" 100Gi)
  eph_lim=$(read_resource eph_lim "$design" 200Gi)

  design_label=$(echo "$design" | tr '_' '-')

  yaml=$(sed \
    -e "s|__JOB_NAME__|${job_name}|g" \
    -e "s|__NAMESPACE__|${NAMESPACE}|g" \
    -e "s|__BRANCH__|${BRANCH}|g" \
    -e "s|__REPO_URL__|${REPO_URL}|g" \
    -e "s|__BAZEL_TARGET__|${bazel_target}|g" \
    -e "s|__SAVE_ARTIFACTS__|${SAVE_ARTIFACTS}|g" \
    -e "s|__CPU_REQUEST__|${cpu_req}|g" \
    -e "s|__CPU_LIMIT__|${cpu_lim}|g" \
    -e "s|__MEM_REQUEST__|${mem_req}|g" \
    -e "s|__MEM_LIMIT__|${mem_lim}|g" \
    -e "s|__EPH_REQUEST__|${eph_req}|g" \
    -e "s|__EPH_LIMIT__|${eph_lim}|g" \
    "$TEMPLATE")

  # Inject pod labels for filtering
  yaml=$(echo "$yaml" | sed \
    '/^      initContainers:$/i\      labels:\n        app: sofa-orfs\n        user: '"$USER_LABEL"'\n        design: '"$design_label"'\n        stage: '"$STAGE"'')

  if [[ "$DRY_RUN" == true ]]; then
    echo "--- # $design / $STAGE"
    echo "$yaml"
    echo ""
  else
    echo -n "  $design ... "
    kubectl delete job "$job_name" -n "$NAMESPACE" --ignore-not-found=true >/dev/null 2>&1
    if echo "$yaml" | kubectl apply -n "$NAMESPACE" -f - >/dev/null 2>&1; then
      echo "submitted ($job_name)"
    else
      echo "FAILED"
      echo "$yaml" | kubectl apply -n "$NAMESPACE" -f - 2>&1 | sed 's/^/    /'
    fi
  fi
done

if [[ "$DRY_RUN" == false ]]; then
  echo ""
  echo "Monitor:"
  echo "  ./k8s/run.sh --status"
  echo "  kubectl logs -f job/$(job_name_for "${DESIGNS[0]}") -n $NAMESPACE -c build"
fi
