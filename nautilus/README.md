# Kubernetes Builds on NRP Nautilus

Runs the SOFA ORFS P&R flow as Kubernetes Jobs on the
[National Research Platform (NRP) Nautilus](https://nationalresearchplatform.org/nautilus/)
cluster. Each SOFA variant (sofa_hd, qlsofa_hd, sofa_chd) submits as a
separate Job using `ubuntu:24.04` + Bazelisk to build via
[bazel-orfs](https://github.com/The-OpenROAD-Project/bazel-orfs).

Modelled after the [HighTide](https://github.com/VLSIDA/HighTide) k8s
infrastructure (`k8s/run.sh`, `design_resources.conf`).

---

## Prerequisites

### 1. kubectl + Nautilus access

```bash
# Install kubectl (macOS)
brew install kubectl

# Download your Nautilus kubeconfig from the portal:
# https://portal.nrp-nautilus.io  → "Get Config"
# Then:
export KUBECONFIG=~/.kube/nautilus-config
kubectl get pods -n <your-namespace>   # verify access
```

### 2. Namespace

You need a Nautilus namespace. Contact NRP support or have a faculty sponsor
request one. Set your namespace in `run.sh` via `--namespace` or configure
your kubectl context.

### 3. PVC for artifacts

Create a persistent volume claim for storing results:

```bash
kubectl apply -n <your-namespace> -f - <<'EOF'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: sofa-orfs-artifacts
spec:
  accessModes: [ReadWriteMany]
  resources:
    requests:
      storage: 200Gi
  storageClassName: rook-cephfs
EOF
```

### 4. RTL committed to the repo

**Critical:** The Kubernetes job clones this repo and runs Bazel. The
generated Verilog and SDC files must be committed (Bazel's `glob(["src/*.v"])`
needs them on disk at build time).

Generate RTL locally first (see README.md macOS/Linux setup), then commit:

```bash
# After running make runOpenFPGA and copying files:
git add -f designs/sofa_hd/src/*.v
git add designs/sofa_hd/src/fpga_top.sdc
git commit -m "Add generated SOFA HD RTL and SDC"
git push
```

The `.gitignore` excludes `*.v` in `src/` by default — override with `-f`.

---

## Submitting Jobs

```bash
# Run full flow for all three variants
./k8s/run.sh --namespace <your-namespace>

# Run full flow for one variant
./k8s/run.sh --namespace <your-namespace> sofa_hd

# Run synthesis only (fast, ~30–90 min) to check RTL issues first
./k8s/run.sh --namespace <your-namespace> sofa_hd --stage synth

# Preview YAML without submitting
./k8s/run.sh --namespace <your-namespace> sofa_hd --dry-run

# Save results to the PVC after the flow completes
./k8s/run.sh --namespace <your-namespace> sofa_hd --save-artifacts

# Run from a specific branch
./k8s/run.sh --namespace <your-namespace> --branch my-branch sofa_hd
```

Available `--stage` values (bazel-orfs target suffixes):

| Stage | Bazel target | Description | Typical runtime |
|-------|-------------|-------------|-----------------|
| `synth` | `:<design>_synth` | Synthesis only | 30–90 min |
| `floorplan` | `:<design>_floorplan` | Through floorplan | +5 min |
| `place` | `:<design>_place` | Through placement | +30–90 min |
| `cts` | `:<design>_cts` | Through clock tree synthesis | +10 min |
| `grt` | `:<design>_grt` | Through global routing | +30–60 min |
| `route` | `:<design>_route` | Through detailed routing | +60–180 min |
| `final` | `:<design>_final` | Full flow including GDS (default) | 3–8 h total |

---

## Monitoring

```bash
# Show job status
./k8s/run.sh --status --namespace <your-namespace>

# Stream logs for a running job
kubectl logs -f job/<job-name> -n <your-namespace> -c build

# Job names follow the pattern: <user>-sofa-<design>-<stage>
# e.g.: marco-sofa-sofa-hd-final
```

---

## Deleting Jobs

```bash
# Delete all sofa-orfs jobs
./k8s/run.sh --delete --namespace <your-namespace>

# Delete jobs for one variant
./k8s/run.sh --delete --namespace <your-namespace> sofa_hd
```

---

## Resource Sizing

Per-design CPU/memory/storage requests are in `k8s/design_resources.conf`.
SOFA fabrics are memory-intensive during routing — sizes are estimated based
on comparable HighTide designs:

| Variant | CPU req | Memory req | Memory limit | Ephemeral |
|---------|---------|------------|--------------|-----------|
| sofa_hd | 16 | 64 Gi | 128 Gi | 100–200 Gi |
| qlsofa_hd | 16 | 96 Gi | 192 Gi | 150–250 Gi |
| sofa_chd | 16 | 96 Gi | 192 Gi | 150–250 Gi |

If a job exits with code 137 (OOMKilled), bump `mem_req`/`mem_lim` in
`design_resources.conf` or pass `--mem` on the command line.

---

## Fetching Artifacts

After a job completes with `--save-artifacts`, copy results from the PVC
via a temporary pod:

```bash
# Spin up a pod that mounts the PVC
kubectl run artifact-fetch --rm -it \
  --image=alpine \
  --overrides='{"spec":{"volumes":[{"name":"pvc","persistentVolumeClaim":{"claimName":"sofa-orfs-artifacts"}}],"containers":[{"name":"artifact-fetch","image":"alpine","command":["sh"],"volumeMounts":[{"name":"pvc","mountPath":"/artifacts"}]}]}}' \
  -n <your-namespace>

# Inside the pod:
ls /artifacts/designs/sofa_hd/
# Then in another terminal:
kubectl cp <your-namespace>/artifact-fetch:/artifacts/designs/sofa_hd ./artifacts/sofa_hd
```

---

## Comparison with HighTide

| | HighTide | sofa-orfs |
|-|----------|-----------|
| Build system | Bazel (`bazel-orfs`) | Bazel (`bazel-orfs`) |
| Container | `ubuntu:24.04` + Bazelisk | `ubuntu:24.04` + Bazelisk |
| RTL source | Generated by Bazel rules | Pre-committed to repo |
| Remote cache | `bazel-remote` HTTP cache | disk cache only (local to job) |
| Designs | Many (multi-platform) | 3 variants (sky130hd only) |
| Namespace | `vlsida` (hardcoded) | auto-detected from kubectl context |
