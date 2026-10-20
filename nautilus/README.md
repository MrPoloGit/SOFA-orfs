# Kubernetes Builds on NRP Nautilus

Runs the SOFA ORFS P&R flow as Kubernetes Jobs on the
[National Research Platform (NRP) Nautilus](https://nationalresearchplatform.org/nautilus/)
cluster. Each SOFA variant (sofa_hd, qlsofa_hd, sofa_chd) submits as a
separate Job using `ubuntu:24.04` + Bazelisk to build via
[bazel-orfs](https://github.com/The-OpenROAD-Project/bazel-orfs).

Namespace: **ucsc-hsc** · PVCs: **sofa-orfs-artifacts**, **sofa-orfs-bazel-cache**

---

## Status (2026-10-15): bazel-orfs bump to upstream main, pending a real Nautilus run

`bazel-orfs` was bumped from `6c1bbca` (764 commits behind) to upstream
`main` at `03b10a1d` — not the GT2N fork other sofa-orfs-adjacent projects
pin. Along with it: `MODULE.bazel` was rewritten to match bazel-orfs's
current `docs/openroad.md` root-override recipe (ORFS now fetches via
`orfs.source()` instead of a root `archive_override`; the hermetic LLVM
toolchain now needs an explicit root `bazel_dep(llvm) + register_toolchains`;
several overrides the old pin needed — `boost.unordered`, `soplex`, `glpk`,
`freetype` — are gone, replaced by a few new ones bazel-orfs's recipe adds),
`.bazelversion` went 8.5.0 → 9.3.0 (bazel-orfs now requires Bazel ≥9.1.1),
and all referenced patch files were copied over from bazel-orfs/patches.
This same work also added the `sofa-orfs-bazel-cache` PVC above.

**Validated locally:** `bazel mod graph` resolves with no errors, and
`bazel build //designs/sofa_hd:sofa_hd_synth` analyzes all three designs
(no `--nobuild`) and gets deep into real compilation of OpenROAD/ODB/
slang/or-tools from source under the hermetic LLVM toolchain — thousands
of actions in, no errors traceable to the bump itself.

**Not validated locally, by design:** a full build cannot complete on
macOS — `tcmalloc` (pulled in transitively by OpenROAD's or-tools
dependency) hard-errors with `"TCMalloc is only supported on Linux"`.
This is an upstream platform constraint, not something this bump can work
around, and it doesn't affect Nautilus (`ubuntu:24.04`, linux/amd64 — see
the `bazelisk-linux-amd64` download in `job-template.yaml`). The real
validation of this bump is therefore the **first Nautilus job run against
it** — treat the next `./nautilus/run.sh` invocation as doing double duty:
confirming the bump and warming the new `sofa-orfs-bazel-cache` PVC for
every run after it. The PVCs above must exist before that first run.

**Known pre-existing state, unrelated to this bump:** the `bazel-orfs`
submodule's own working tree had uncommitted edits before this bump
started (cosmetic Unicode→ASCII cleanups across several files, plus an
updated `qt-bazel-xcb-cursor-from-source.patch`) that predate this
session. They were stashed (`git -C bazel-orfs stash list`) rather than
discarded or carried forward — recover with
`git -C bazel-orfs stash pop` if they're wanted, after reviewing what
they are.

---

## Prerequisites

### 1. kubectl + Nautilus access

```bash
brew install kubectl
# Download kubeconfig from https://portal.nrp-nautilus.io → "Get Config"
export KUBECONFIG=~/.kube/nautilus-config
kubectl get pods -n ucsc-hsc   # verify access
```

### 2. PVCs (one-time setup)

```bash
kubectl apply -n ucsc-hsc -f - <<'EOF'
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
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: sofa-orfs-bazel-cache
spec:
  accessModes: [ReadWriteMany]
  resources:
    requests:
      storage: 100Gi
  storageClassName: rook-cephfs
EOF
```

`sofa-orfs-bazel-cache` backs `--disk_cache`/`--repository_cache` (mounted
at `/root/.cache/bazel-persist`) so repeated jobs — a rerun after a failure,
or a later stage on a fresh pod — reuse OpenROAD/Yosys/LLVM toolchain
artifacts from prior jobs instead of rebuilding them from scratch. Shared
`ReadWriteMany` is safe here: Bazel's disk cache is content-addressed and
built for concurrent access, so the three designs' jobs can mount it at
once.

---

## Workflow

Each Nautilus pod starts with no cache, so run the full flow in one job
(`--stage final` is the default) rather than stage-by-stage.
Use `--save-artifacts` so results land on the PVC if the job fails mid-way.

### Step 1 — Run sofa_hd full flow

```bash
./nautilus/run.sh sofa_hd --namespace ucsc-hsc --save-artifacts
```

### Step 2 — While sofa_hd runs, start the other two designs

```bash
./nautilus/run.sh qlsofa_hd --namespace ucsc-hsc --save-artifacts
./nautilus/run.sh sofa_chd  --namespace ucsc-hsc --save-artifacts
```

### Step 3 — Check job status

```bash
./nautilus/run.sh --status --namespace ucsc-hsc
```

### Step 4 — Stream logs for a running job

```bash
kubectl logs -f job/marcofrank-sofa-sofa-hd-final   -n ucsc-hsc -c build
kubectl logs -f job/marcofrank-sofa-qlsofa-hd-final -n ucsc-hsc -c build
kubectl logs -f job/marcofrank-sofa-sofa-chd-final  -n ucsc-hsc -c build
```

### Step 5 — After build, save the full log and check key metrics

```bash
# Save log to file
kubectl logs job/marcofrank-sofa-sofa-hd-final -n ucsc-hsc -c build > sofa_hd_build.log

# Synthesis — cell area
grep -E "Design area|Chip area" sofa_hd_build.log | head -5

# Floorplan — core utilization
grep -E "Design area|utilization" sofa_hd_build.log | grep -v Yosys | head -5

# Global route — overflow (must reach 0 for detailed route to succeed)
grep -E "overflow|Overflow|Total overflow" sofa_hd_build.log | tail -20

# Detailed route — DRC violations (want 0 at end)
grep -E "violations|DRC|Short" sofa_hd_build.log | tail -20

# Timing — worst negative slack (want ≥ 0)
grep -E "wns|tns|WNS|TNS|worst slack" sofa_hd_build.log | tail -10

# Per-stage summary table
grep -E "Log.*Elapsed|\.odb" sofa_hd_build.log | tail -20
```

### Step 6 — Browse artifacts on the PVC

```bash
kubectl run -n ucsc-hsc viewer --rm -it --restart=Never \
  --image=alpine \
  --overrides='{"spec":{"volumes":[{"name":"a","persistentVolumeClaim":{"claimName":"sofa-orfs-artifacts"}}],"containers":[{"name":"viewer","image":"alpine","command":["sh"],"stdin":true,"tty":true,"volumeMounts":[{"name":"a","mountPath":"/a"}]}]}}'

# Inside the pod — explore results
ls /a/designs/sofa_hd/
ls /a/designs/sofa_hd/logs/sky130hd/fpga_top/base/
cat /a/designs/sofa_hd/logs/sky130hd/fpga_top/base/5_1_grt.log | tail -60
cat /a/designs/sofa_hd/logs/sky130hd/fpga_top/base/6_1_detailed_route.log | tail -30
```

### Step 7 — Copy a file from PVC to Mac

```bash
# While the viewer pod is running (Step 6), in another terminal:
kubectl cp -n ucsc-hsc viewer:/a/designs/sofa_hd/results/sky130hd/fpga_top/base/6_route.odb ./sofa_hd_route.odb
kubectl cp -n ucsc-hsc viewer:/a/designs/sofa_hd/logs/sky130hd/fpga_top/base/5_1_grt.log ./grt.log
```

---

## Other useful commands

```bash
# Dry-run — print YAML without submitting
./nautilus/run.sh sofa_hd --namespace ucsc-hsc --dry-run

# Run from a different branch
./nautilus/run.sh sofa_hd --namespace ucsc-hsc --branch my-branch --save-artifacts

# Delete all sofa-orfs jobs
./nautilus/run.sh --delete --namespace ucsc-hsc

# Delete jobs for one design
./nautilus/run.sh --delete sofa_hd --namespace ucsc-hsc
```

---

## Stage reference

Each stage is a Bazel target suffix. Run `--stage <stage>` to stop after that point.
With the `sofa-orfs-bazel-cache` PVC mounted, a later stage on a fresh pod
gets cache hits (from `--disk_cache`) for any prior action it reruns with
identical inputs — the OpenROAD/Yosys/LLVM toolchain build in particular,
which only has to happen once across all jobs that share the PVC, not once
per pod. Stage actions specific to that run (synthesis, placement, routing
on this design's actual inputs) still execute normally.

| Stage | Bazel target | Notes | Typical wall time |
|-------|-------------|-------|-------------------|
| `synth` | `:<design>_synth` | Yosys + ABC | 20–30 min |
| `floorplan` | `:<design>_floorplan` | PDN insertion | +5 min |
| `place` | `:<design>_place` | Global + detail place | +30–60 min |
| `cts` | `:<design>_cts` | Clock tree synthesis | +10 min |
| `grt` | `:<design>_grt` | FastRoute global route | +30–60 min |
| `route` | `:<design>_route` | TritonRoute detailed route | +60–180 min |
| `final` | `:<design>_final` | GDS, DRC, LVS summary | 3–8 h total |

---

## Resource sizing

Per-design CPU/memory/storage requests are in `nautilus/design_resources.conf`.

| Variant | CPU req | Memory req | Memory limit | Ephemeral |
|---------|---------|------------|--------------|-----------|
| sofa_hd | 16 | 160 Gi | 192 Gi | 100–120 Gi |
| qlsofa_hd | 16 | 160 Gi | 192 Gi | 150–180 Gi |
| sofa_chd | 16 | 160 Gi | 192 Gi | 150–180 Gi |

All limits are 1.2× the request (Nautilus policy maximum).
If a job exits code 137 (OOMKilled), bump `mem_req`/`mem_lim` in
`design_resources.conf` and resubmit.

---

## Design sizes (from synthesis)

| Variant | Channel width | Cell area (synthesis) | Die area (OpenROAD) |
|---------|--------------|----------------------|---------------------|
| sofa_hd | W=40 | 2,797,999 um^2 | 2800×2800 um |
| qlsofa_hd | W=60 | TBD | 3200×3200 um |
| sofa_chd | W=60 + CPL | TBD | 3200×3200 um |

Die areas match the ICC2 reference runs in the SOFA submodule
(`sofa/FPGA1212_*_PNR/*/proj_const.tcl`).
