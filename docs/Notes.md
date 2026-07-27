# Notes

## False paths for configuration chain ports

All static configuration (programming) paths should be declared as false paths in every `constraint.sdc`. This is standard practice for eFPGA fabrics - FABulous FPGA (Imperial College / UCL open-source eFPGA framework) applies the same strategy for all configuration scan ports.

**Why:** The SRAM programming chain (`ccff_head` -> shift registers -> `ccff_tail`) is only active during bitstream loading. During functional operation the chain is held static. Without false paths, STA tries to time the full shift-register chain, which (a) is not a real functional constraint and (b) forces unnecessary clock tree buffering deep into the SRAM array.

**What to add to all three `constraint.sdc` files:**

```tcl
set_false_path -from [get_ports ccff_head]
set_false_path -to   [get_ports ccff_tail]

# If prog_reset is present in the generated fpga_top port list:
# set_false_path -from [get_ports prog_reset]
```

**Before doing this**, verify the exact port names from the generated RTL:
```bash
grep -E "^\s*(input|output)" designs/sofa_hd/src/fpga_top.v | grep -i "ccff\|prog_reset"
```

Port names are set by OpenFPGA's arch XML and should be consistent across all three variants, but confirm for each one.

**Did the original ICC2 flow also use false paths?**
Almost certainly yes - and from the same source. `make runOpenFPGA` generates
an SDC file alongside the Verilog RTL (typically `fpga_top.sdc` or similar in
the `SRC/` directory). That generated SDC includes false path declarations for
the configuration chain by default. The ICC2 flow consumed that file directly.

In this repo we wrote a custom `constraint.sdc` instead of using the
OpenFPGA-generated one. Two options when RTL is available:
1. **Use the generated SDC directly** - set `SDC_FILE` to the OpenFPGA output
   and inherit all false paths automatically. Safest for correctness.
2. **Keep the custom SDC** - manually add the false paths confirmed from the
   generated SDC. More explicit and easier to audit.

Check for the generated SDC after running `make runOpenFPGA`:
```bash
find ~/SOFA/FPGA1212_SOFA_HD_PNR -name "*.sdc" | head -5
```

---

## Original SOFA implementation timeline

The original SOFA tape-outs were done using Synopsys ICC2 as part of the
Google/Skywater **MPW-1 shuttle** (the first open multi-project wafer run).

| Event                              | Date (approx.)   |
|------------------------------------|------------------|
| MPW-1 shuttle submission deadline  | November 2020    |
| SOFA paper published (ISFPGA 2021) | February 2021    |
| MPW-1 chips returned from fab      | Mid 2021         |

**Synopsys ICC2 version:** Not stated in the paper or public repo.
Based on the MPW-1 timeline (late 2020), the version in use was likely
**ICC2 2019.12** or **ICC2 2020.09** - the two releases available to
academic licenses at that time. If the exact version matters (e.g. for
reproducing a specific bug or feature), contact Xifan Tang's group at
University of Utah (the SOFA/OpenFPGA authors) directly.

**What may have changed since 2020:**
- OpenFPGA has been actively developed; the arch XML format and generated
  RTL structure may differ between the 2020 version used for MPW-1 and
  current `main` branch. Pin to the commit closest to the paper date if
  exact RTL reproducibility is needed.
- sky130hd PDK has been updated (cell timing, DRC rules); minor timing
  differences from the ICC2 baseline are expected even with a perfect flow.
- ORFS/OpenROAD has improved significantly - routing quality in 2024–2025
  builds is meaningfully better than 2020–2021 builds.

---

## ORFS vs Synopsys ICC2

| Aspect                  | ORFS (OpenROAD)                        | Synopsys ICC2                          |
|-------------------------|----------------------------------------|----------------------------------------|
| License                 | Open-source (BSD)                      | Commercial (expensive)                 |
| Reproducibility         | Anyone can run it                      | Requires Synopsys license              |
| Global routing          | FastRoute - good, but weaker on extreme congestion | Zroute - significantly better congestion prediction and handling |
| Placement               | RePlAce (analytical) + OpenDP          | ICC2 analytical + timing-driven ECO iterations |
| CTS                     | TritonCTS - adequate for 50 MHz target | More mature, tighter skew control      |
| Custom cell integration | Via ADDITIONAL_LEFS/LIBS               | Native characterization + ICC2 tech files |
| Runtime (congested design) | More manual tuning iterations likely | Faster convergence on difficult designs |
| Silicon proven          | Growing (many sky130 tapeouts)         | SOFA MPW-1 passed DRC/LVS with zero violations |
| Timing closure margin   | TBD for SOFA                           | +0.4 ns worst slack at 50 MHz          |

**Key practical difference for SOFA:** FastRoute's congestion model is less sophisticated than Zroute for highly regular, repetitive mux-tree structures like FPGA routing fabrics. This is the main reason Phases 4–5 of the plan exist - ICC2 likely routed SOFA without significant manual tuning, whereas ORFS will probably require die-area expansion and layer-adjustment iteration.

**If ORFS achieves timing closure**, the result is more valuable than the ICC2 baseline for the open community precisely because it is reproducible. The comparison table (area, timing, wire length, runtime) becomes the core of the paper.
