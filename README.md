# sofa-orfs

Open-source re-implementation of the SOFA eFPGA series using
[OpenROAD Flow Scripts](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts)
on the sky130hd PDK.

The original SOFA tape-outs (MPW-1) were done with Synopsys ICC2. This project
reproduces all three variants using only open-source EDA tools.

---

## Variants

| Variant     | Grid   | W   | Cells         | Status      |
|-------------|--------|-----|---------------|-------------|
| SOFA HD     | 12x12  | 40  | Standard only | In progress |
| QLSOFA HD   | 12x12  | 60  | Standard only | Planned     |
| SOFA CHD    | 12x12  | 60  | + CPL custom  | Planned     |

---

## Prerequisites (all platforms)

Before running any flow you need:

1. **SOFA repo** - contains arch XMLs and CHD custom cells
2. **OpenFPGA** - generates the Verilog RTL from the arch XMLs
3. **OpenROAD Flow Scripts (ORFS)** - runs synthesis -> place -> route -> GDS

How you install ORFS depends on your OS (see platform sections below).

---

## Linux (x86_64)

ORFS can be built natively on Ubuntu 20.04/22.04. Other distros work but
require manual dependency resolution.

### Requirements

- Ubuntu 20.04 or 22.04 (x86_64)
- 16 GB RAM minimum, 32 GB recommended
- CMake ≥ 3.22
- ~60 GB free disk space

### Setup

```bash
# 1. Clone ORFS with submodules
git clone --recursive \
  https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git \
  ~/OpenROAD-flow-scripts
cd ~/OpenROAD-flow-scripts

# 2. Install system dependencies
sudo ./setup.sh

# 3. Build OpenROAD and Yosys from source (20–60 min)
./build_openroad.sh

# 4. Add tools to PATH
echo 'export ORFS_HOME=~/OpenROAD-flow-scripts' >> ~/.bashrc
echo 'export FLOW_HOME=$ORFS_HOME/flow' >> ~/.bashrc
echo 'export PATH=$ORFS_HOME/tools/install/OpenROAD/bin:$PATH' >> ~/.bashrc
echo 'export PATH=$ORFS_HOME/tools/install/yosys/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# 5. Smoke test
cd ~/OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=designs/nangate45/gcd/config.mk
# Expect: results/nangate45/gcd/base/6_final.gds

# 6. Clone OpenFPGA and SOFA
git clone https://github.com/lnis-uofu/OpenFPGA.git ~/OpenFPGA
git clone https://github.com/lnis-uofu/SOFA.git ~/SOFA

# 7. Build OpenFPGA
sudo apt-get install -y cmake build-essential python3 python3-pip \
  libreadline-dev libffi-dev tcl-dev bison flex
cd ~/OpenFPGA
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)

export OPENFPGA_PATH=~/OpenFPGA
echo 'export OPENFPGA_PATH=~/OpenFPGA' >> ~/.bashrc

# 8. Generate SOFA HD RTL
cd ~/SOFA/FPGA1212_SOFA_HD_PNR
make runOpenFPGA

# 9. Copy RTL and run
cd /path/to/sofa-orfs
RTL_SRC=~/SOFA/FPGA1212_SOFA_HD_PNR/FPGA1212_SOFA_HD_task/latest/vpr_arch/top/MIN_ROUTE_CHAN_WIDTH/SRC
cp $RTL_SRC/*.v designs/sofa_hd/src/

ln -sf $(pwd)/designs/sofa_hd \
       ~/OpenROAD-flow-scripts/flow/designs/sofa_hd

cd ~/OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=designs/sofa_hd/config.mk synth
```

**Tip for non-Ubuntu distros:** Read `~/OpenROAD-flow-scripts/setup.sh` and
install equivalent packages for your package manager, then proceed from step 3.

---

## macOS

ORFS does not build natively on macOS. Use Docker.

### Requirements

- macOS 12+ (Intel or Apple Silicon)
- [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop/)

### Resource configuration

Open Docker Desktop -> **Settings -> Resources** and set:

| Resource | Minimum | Recommended |
|----------|---------|-------------|
| CPUs     | 8       | All available |
| Memory   | 16 GB   | 32 GB       |
| Disk     | 60 GB   | 100 GB      |

On **Apple Silicon (M1/M2/M3)** also enable:  
Settings -> General -> **"Use Rosetta for x86/amd64 emulation"**

### Setup

```bash
# Apple Silicon only - install Rosetta if not already present
softwareupdate --install-rosetta

# 1. Pull ORFS Docker image (x86_64 - runs via Rosetta on Apple Silicon)
docker pull openroad/orfs:latest

# Verify
docker run --rm openroad/orfs:latest openroad -version
docker run --rm openroad/orfs:latest yosys --version

# 2. Clone ORFS (needed for docker_shell wrapper and flow scripts)
git clone --recursive \
  https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git \
  ~/OpenROAD-flow-scripts

echo 'export ORFS_HOME=~/OpenROAD-flow-scripts' >> ~/.zshrc
echo 'export FLOW_HOME=$ORFS_HOME/flow' >> ~/.zshrc
source ~/.zshrc

# 3. Smoke test with the GCD example (should finish in <5 min)
cd ~/OpenROAD-flow-scripts/flow
../util/docker_shell make DESIGN_CONFIG=designs/nangate45/gcd/config.mk
# Expect: results/nangate45/gcd/base/6_final.gds

# 4. Clone OpenFPGA and SOFA
git clone https://github.com/lnis-uofu/OpenFPGA.git ~/OpenFPGA
git clone https://github.com/lnis-uofu/SOFA.git ~/SOFA

# 5. Build OpenFPGA inside an x86_64 Ubuntu container
#    (OpenFPGA requires Linux; mount repos so results persist)
docker run -it --platform linux/amd64 \
  -v ~/OpenFPGA:/OpenFPGA \
  -v ~/SOFA:/SOFA \
  ubuntu:22.04 bash

# --- Inside the container: ---
apt-get update && apt-get install -y \
  cmake build-essential python3 python3-pip \
  libreadline-dev libffi-dev tcl-dev bison flex
cd /OpenFPGA
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)
# Verify:
/OpenFPGA/build/openfpga/openfpga --version
# --- Exit container ---

# 6. Generate SOFA HD RTL (run inside the same container or a new one)
docker run --rm --platform linux/amd64 \
  -v ~/OpenFPGA:/OpenFPGA \
  -v ~/SOFA:/SOFA \
  -e OPENFPGA_PATH=/OpenFPGA \
  ubuntu:22.04 bash -c "
    apt-get update -qq && apt-get install -y make python3 >/dev/null
    cd /SOFA/FPGA1212_SOFA_HD_PNR && make runOpenFPGA
  "

# 7. Copy RTL into sofa-orfs
RTL_SRC=~/SOFA/FPGA1212_SOFA_HD_PNR/FPGA1212_SOFA_HD_task/latest/vpr_arch/top/MIN_ROUTE_CHAN_WIDTH/SRC
cp $RTL_SRC/*.v   designs/sofa_hd/src/
cp $RTL_SRC/*.sdc designs/sofa_hd/src/

# 8. Link design into ORFS and run
ln -sf $(pwd)/designs/sofa_hd \
       ~/OpenROAD-flow-scripts/flow/designs/sofa_hd

cd ~/OpenROAD-flow-scripts/flow
../util/docker_shell make DESIGN_CONFIG=designs/sofa_hd/config.mk synth
```

---

## Linux (x86_64)

ORFS can be built natively on Ubuntu. Other distros work but require manual
dependency resolution.

### Requirements

- Ubuntu 22.04 or 24.04 (x86_64) - **24.04 recommended** (current LTS)
- 16 GB RAM minimum, 32 GB recommended
- CMake ≥ 3.22
- ~60 GB free disk space

### Setup

```bash
# 1. Clone ORFS with submodules
git clone --recursive \
  https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git \
  ~/OpenROAD-flow-scripts
cd ~/OpenROAD-flow-scripts

# 2. Install system dependencies
sudo ./setup.sh

# 3. Build OpenROAD and Yosys from source (20–60 min)
./build_openroad.sh

# 4. Add tools to PATH
echo 'export ORFS_HOME=~/OpenROAD-flow-scripts' >> ~/.bashrc
echo 'export FLOW_HOME=$ORFS_HOME/flow' >> ~/.bashrc
echo 'export PATH=$ORFS_HOME/tools/install/OpenROAD/bin:$PATH' >> ~/.bashrc
echo 'export PATH=$ORFS_HOME/tools/install/yosys/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# 5. Smoke test
cd ~/OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=designs/nangate45/gcd/config.mk
# Expect: results/nangate45/gcd/base/6_final.gds

# 6. Clone OpenFPGA and SOFA
git clone https://github.com/lnis-uofu/OpenFPGA.git ~/OpenFPGA
git clone https://github.com/lnis-uofu/SOFA.git ~/SOFA

# 7. Build OpenFPGA
sudo apt-get install -y cmake build-essential python3 python3-pip \
  libreadline-dev libffi-dev tcl-dev bison flex
cd ~/OpenFPGA
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)

export OPENFPGA_PATH=~/OpenFPGA
echo 'export OPENFPGA_PATH=~/OpenFPGA' >> ~/.bashrc

# 8. Generate SOFA HD RTL
cd ~/SOFA/FPGA1212_SOFA_HD_PNR
make runOpenFPGA

# 9. Copy RTL and run
cd /path/to/sofa-orfs
RTL_SRC=~/SOFA/FPGA1212_SOFA_HD_PNR/FPGA1212_SOFA_HD_task/latest/vpr_arch/top/MIN_ROUTE_CHAN_WIDTH/SRC
cp $RTL_SRC/*.v   designs/sofa_hd/src/
cp $RTL_SRC/*.sdc designs/sofa_hd/src/

ln -sf $(pwd)/designs/sofa_hd \
       ~/OpenROAD-flow-scripts/flow/designs/sofa_hd

cd ~/OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=designs/sofa_hd/config.mk synth
```

**Tip for non-Ubuntu distros:** Read `~/OpenROAD-flow-scripts/setup.sh` and
install equivalent packages for your package manager, then proceed from step 3.

---

## Windows

ORFS is not supported natively on Windows. Use **WSL 2** with Ubuntu, then
follow the Linux instructions above inside the WSL environment.

### Setup WSL 2

```powershell
# In an elevated PowerShell or Windows Terminal (Admin):
wsl --install -d Ubuntu-24.04
```

Restart when prompted, then open **Ubuntu 24.04** from the Start menu and
complete the Linux setup steps above.

### Docker alternative

If you prefer Docker Desktop for Windows (WSL 2 backend):

1. Install [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/)
2. Enable **WSL 2 backend** in Settings -> General
3. Open an Ubuntu WSL terminal and follow the macOS Docker steps above
   (the commands are identical once inside WSL)

### Resource configuration

For both WSL 2 and Docker Desktop, Windows limits WSL memory by default.
Create or edit `%USERPROFILE%\.wslconfig`:

```ini
[wsl2]
memory=32GB
processors=8
swap=8GB
```

Then restart WSL: `wsl --shutdown` in PowerShell.

---

## Running the flow (all platforms)

Once setup is complete, these commands work the same everywhere
(substitute `../util/docker_shell make` for `make` on macOS):

```bash
cd ~/OpenROAD-flow-scripts/flow

# Run a single stage
make DESIGN_CONFIG=designs/sofa_hd/config.mk synth
make DESIGN_CONFIG=designs/sofa_hd/config.mk floorplan
make DESIGN_CONFIG=designs/sofa_hd/config.mk place
make DESIGN_CONFIG=designs/sofa_hd/config.mk cts
make DESIGN_CONFIG=designs/sofa_hd/config.mk route
make DESIGN_CONFIG=designs/sofa_hd/config.mk finish

# Run the full flow end-to-end
make DESIGN_CONFIG=designs/sofa_hd/config.mk

# Clean a stage and re-run it (e.g. after tuning fastroute.tcl)
make DESIGN_CONFIG=designs/sofa_hd/config.mk clean_route
make DESIGN_CONFIG=designs/sofa_hd/config.mk route

# Open the GUI at any stage
make DESIGN_CONFIG=designs/sofa_hd/config.mk gui_floorplan
make DESIGN_CONFIG=designs/sofa_hd/config.mk gui_route

# Switch to a different variant
make DESIGN_CONFIG=designs/qlsofa_hd/config.mk [target]
make DESIGN_CONFIG=designs/sofa_chd/config.mk [target]
```

---

## Architecture reference

See `docs/SOFA_RESEARCH.md` for:
- Architectural parameters (CLB, channel width, tile dimensions)
- Timing targets and published results from ICC2 runs
- Die area estimates and congestion mitigation guidance
- CHD custom cell specifications

See `docs/Results.md` for:
- Results of original paper
- Results from ORFS
- Comparison
