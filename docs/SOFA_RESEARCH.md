# SOFA Architecture Research Reference

Primary source: "SOFA: An Open-Source FPGA in a Can" (ISFPGA 2021, Xifan Tang et al.)
GitHub: https://github.com/lnis-uofu/SOFA

---

## Section 1 — Fabric Overview

All three SOFA variants share the same 12x12 CLB array topology:

```
+-------+-------+-----+-------+
| I/O   | CLB   | ... | I/O   |
+-------+-------+-----+-------+
| CLB   | CLB   | ... | CLB   |   ← 12 rows
|  ...  |  ...  | ... |  ...  |
| CLB   | CLB   | ... | CLB   |
+-------+-------+-----+-------+
| I/O   | CLB   | ... | I/O   |
+-------+-------+-----+-------+
           12 columns
```

**Total CLB count:** 144 (12 x 12)  
**I/O count:** ~48 (12 per side, corners shared)

Each CLB contains:
- 2x 6-input LUT (K=6, N=2 per CLB)
- 2x D flip-flop with configurable reset polarity
- Local routing and carry chain
- Configuration SRAM cells (prog_clk domain)

---

## Section 2 — Variant Parameters

### SOFA HD

| Parameter              | Value                        |
|------------------------|------------------------------|
| Channel width (W)      | 40 (tracks per channel)      |
| Cell library           | sky130hd (standard cells)    |
| Top module             | `fpga_top`                   |
| Clock port             | `prog_clk`                   |
| Clock target           | 50 MHz (20 ns period)        |
| Estimated die area     | ~3.0–3.5 $mm^2$              |
| Estimated cell count   | 4–8 M standard cell instances|
| Placement density target | 40–50%                     |

### QLSOFA HD

| Parameter              | Value                        |
|------------------------|------------------------------|
| Channel width (W)      | 60                           |
| Cell library           | sky130hd (standard cells)    |
| Top module             | `fpga_top`                   |
| Clock port             | `prog_clk`                     |
| Clock target           | 50 MHz (20 ns period)          |
| Estimated die area     | ~4.5–5.5 $mm^2$                |
| Estimated cell count   | 6–12 M standard cell instances |
| Placement density target | 40–50%                       |

W=60 produces significantly more routing mux trees than W=40 —
expect ~50% larger area and higher congestion.

### SOFA CHD

| Parameter              | Value                        |
|------------------------|------------------------------|
| Channel width (W)      | 60                           |
| Cell library           | sky130hd + CPL custom cells  |
| Custom cells           | invmux2_1, invmux3_1        |
| Top module             | `fpga_top`                   |
| Clock port             | `prog_clk`                   |
| Clock target           | 50 MHz (20 ns period)        |
| Estimated die area     | ~4.0–5.0 $mm^2$              |
| Notes                  | CPL cells are area-compact   |

---

## Section 3 — CLB Tile Dimensions

Estimated CLB tile size on sky130hd based on ICC2 results and cell density:

| Variant   | Tile width (µm) | Tile height (µm) | Tile area (mm²) |
|-----------|-----------------|------------------|-----------------|
| SOFA HD   | ~130–160        | ~130–160         | ~0.017–0.026    |
| QLSOFA HD | ~160–200        | ~160–200         | ~0.026–0.040    |
| SOFA CHD  | ~130–170        | ~130–170         | ~0.017–0.029    |

For hierarchical P&R (Phase 4.5), use a standalone tile die of approximately
160x160 µm (SOFA HD) or 200x200 µm (QLSOFA/CHD).

---

## Section 4 — CHD Custom CPL Cells

SOFA CHD replaces standard sky130hd mux2/mux3 cells in the routing fabric
with custom Complementary Pass-transistor Logic (CPL) cells:

| Cell name                                 | Function  | Sky130 cell replaced     |
|-------------------------------------------|-----------|--------------------------|
| `sky130_uuopenfpga_cc_hd_invmux2_1`      | 2:1 mux   | `sky130_fd_sc_hd__mux2_1` |
| `sky130_uuopenfpga_cc_hd_invmux3_1`      | 3:1 mux   | `sky130_fd_sc_hd__mux4_1` (split) |

**Timing improvement:** CPL cells achieve approximately **27% reduction in
cell delay** compared to standard CMOS mux cells for the routing switch
function. This comes from reduced input capacitance and eliminated inverter
stages in the transmission-gate topology.

**Area trade-off:** CPL cells are slightly more area-efficient than
standard mux2 at sky130hd, contributing to the ~5–10% smaller die area
of CHD vs QLSOFA HD despite identical W=60.

**Power:** CPL has lower switching power but higher leakage due to the
pass-transistor topology. Net effect on full fabric power is roughly neutral.

Cell files live in `custom_cells/` once extracted from the SOFA repo:
```
custom_cells/
  sky130_uuopenfpga_cc_hd_invmux2_1.lef
  sky130_uuopenfpga_cc_hd_invmux2_1_tt_025C_1v80.lib
  sky130_uuopenfpga_cc_hd_invmux2_1.v
  sky130_uuopenfpga_cc_hd_invmux3_1.lef
  sky130_uuopenfpga_cc_hd_invmux3_1_tt_025C_1v80.lib
  sky130_uuopenfpga_cc_hd_invmux3_1.v
```

---

## Section 5 — Timing Reference (ICC2 Results)

From the original SOFA ICC2 tape-out (MPW-1):

| Path                      | Delay (ns) | Notes                        |
|---------------------------|------------|------------------------------|
| Routing A->B (adjacent)    | 1.61       | Single hop, W=40             |
| LUT delay (6-input)       | ~0.8       | At 1.8V, 25°C                |
| CLB setup time            | ~0.3       | Registered path              |
| prog_clk period (achieved)| 20.0       | 50 MHz, positive slack       |
| Worst setup slack (ICC2)  | +0.4 ns    | Marginal but closed          |

**Target for ORFS run:** worst setup slack ≥ 0 ns at 50 MHz.

If timing fails at 50 MHz, relax to 40 MHz (25 ns period) as a first step.
The fabric is not speed-critical — it is a programmable device where
the configuration path (prog_clk) is the limiting constraint.

---

## Section 6 — Die Area Tuning Guidance

ORFS routing frequently fails for FPGA fabrics due to extreme routing
density (every CLB output fans into many routing mux inputs).

**Starting die area (SOFA HD):** 1900x1900 µm (3.61 $mm^2$)  
**Core area:** 10 µm margin on each side -> 1880x1880 µm core

**Escalation ladder:**

| Attempt | DIE_AREA           | PLACE_DENSITY | Expected result          |
|---------|--------------------|---------------|--------------------------|
| 1       | 0 0 1900 1900      | 0.40          | May fail — try first     |
| 2       | 0 0 2100 2100      | 0.40          | +10% area                |
| 3       | 0 0 2100 2100      | 0.35          | Reduce density           |
| 4       | 0 0 2400 2400      | 0.35          | +25% from attempt 1      |
| 5       | 0 0 2400 2400      | 0.30          | Last resort flat P&R     |

**Rule of thumb:** For FPGA mux trees, each 10% increase in die area
reduces routing congestion by approximately 15–20% (superlinear relief
because congestion is localized near channel crossings).

For QLSOFA HD and CHD (W=60), start 20% larger:

| Variant   | Starting DIE_AREA  | Notes                        |
|-----------|--------------------|------------------------------|
| SOFA HD   | 0 0 1900 1900      | W=40                         |
| QLSOFA HD | 0 0 2300 2300      | W=60, 50% more tracks        |
| SOFA CHD  | 0 0 2100 2100      | W=60, CPL cells more compact |

**Hierarchical approach (nuclear option):**  
If flat P&R fails after attempt 5, switch to hard-macro tile flow:
1. P&R a single CLB tile standalone (160x160 µm target)
2. Generate LEF abstraction and hand-written LIB
3. Reassemble 144 tiles as macros with top-level P&R
4. Top-level has only power/IO routing — trivially routable

---

## Section 7 — RTL Characteristics

Generated RTL from OpenFPGA has characteristic patterns that affect synthesis:

**File count:** 20–60 `.v` files per variant  
**Total line count:** 50,000–200,000 lines for SOFA HD  
**Key files:**
- `fpga_top.v` — top-level module (clock ports, I/O)
- `fpga_defines.v` — global parameters and macros
- `sb_*.v` — switch box modules (routing mux heavy)
- `cbx_*.v`, `cby_*.v` — connection box modules
- `grid_*.v` — CLB tile modules

**Common synthesis issues:**
- Latches inferred from combinational RTL -> fix with `-nosdff` Yosys flag
- Multi-driven nets in switch boxes -> benign, suppress with ORFS synth flags
- Huge cell count (millions) -> expect 30–90 min synthesis time

**Top-level clock port name:** Typically `prog_clk` but verify with:
```bash
grep -i "input.*clk\|clk.*input" designs/sofa_hd/src/fpga_top.v | head -5
```

---

## Section 8 — DRC / LVS Notes

The original SOFA MPW-1 tape-out passed DRC/LVS with zero violations.
Key checks for the ORFS run:

- **met1 spacing:** ORFS PDN straps occasionally cause met1 DRC errors near
  power rings — adjust stripe pitch in pdn.tcl if violations appear
- **Metal fill:** sky130hd KLayout scripts add automated fill; ensure
  `FILL_CELLS` is set or the default sky130hd fill is active
- **Custom cells (CHD only):** Verify that invmux2/invmux3 LEF has correct
  sky130hd layer names (`met1`, `met2`, not `M1`, `M2`)

---

## Section 9 — Reference Links

- SOFA repo: https://github.com/lnis-uofu/SOFA
- OpenFPGA: https://github.com/lnis-uofu/OpenFPGA
- ORFS: https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
- sky130hd PDK: https://github.com/google/skywater-pdk
- SOFA paper (ISFPGA 2021): doi.org/10.1145/3431920.3439300
