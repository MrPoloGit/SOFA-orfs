# Kubernetes Builds on NRP Nautilus

Runs the SOFA ORFS P&R flow as Kubernetes Jobs on the
[National Research Platform (NRP) Nautilus](https://nationalresearchplatform.org/nautilus/)
cluster. Each SOFA variant (sofa_hd, qlsofa_hd, sofa_chd) submits as a
separate Job using `ubuntu:24.04` + Bazelisk to build via
[bazel-orfs](https://github.com/The-OpenROAD-Project/bazel-orfs).

Namespace: **ucsc-hsc** · PVC: **sofa-orfs-artifacts**

---

## Prerequisites

### 1. kubectl + Nautilus access

```bash
brew install kubectl
# Download kubeconfig from https://portal.nrp-nautilus.io → "Get Config"
export KUBECONFIG=~/.kube/nautilus-config
kubectl get pods -n ucsc-hsc   # verify access
```

### 2. PVC (one-time setup)

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
EOF
```

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
Rerunning a later stage on a fresh pod re-runs all prior stages (no cross-pod cache).

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
| sofa_hd | 16 | 64 Gi | 128 Gi | 100–200 Gi |
| qlsofa_hd | 16 | 96 Gi | 192 Gi | 150–250 Gi |
| sofa_chd | 16 | 96 Gi | 192 Gi | 150–250 Gi |

If a job exits code 137 (OOMKilled), bump `mem_req`/`mem_lim` in
`design_resources.conf` or pass `--mem 128Gi` on the command line.

---

## Design sizes (from synthesis)

| Variant | Channel width | Cell area (synthesis) | Die area (OpenROAD) |
|---------|--------------|----------------------|---------------------|
| sofa_hd | W=40 | 2,797,999 um^2 | 2800×2800 um |
| qlsofa_hd | W=60 | TBD | 3200×3200 um |
| sofa_chd | W=60 + CPL | TBD | 3200×3200 um |

Die areas match the ICC2 reference runs in the SOFA submodule
(`sofa/FPGA1212_*_PNR/*/proj_const.tcl`).
