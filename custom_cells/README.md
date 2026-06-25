# custom_cells

This directory holds the CPL (Complementary Pass-transistor Logic) custom
cells used by the SOFA CHD variant.

---

## Files expected here (after Phase 5 setup)

```
sky130_uuopenfpga_cc_hd_invmux2_1.lef
sky130_uuopenfpga_cc_hd_invmux2_1_tt_025C_1v80.lib
sky130_uuopenfpga_cc_hd_invmux2_1.v

sky130_uuopenfpga_cc_hd_invmux3_1.lef
sky130_uuopenfpga_cc_hd_invmux3_1_tt_025C_1v80.lib
sky130_uuopenfpga_cc_hd_invmux3_1.v
```

## Extraction

These files come from the SOFA repository:

```bash
SOFA_PDK=~/SOFA/FPGA1212_SOFA_CHD_PNR/PDK

cp $SOFA_PDK/sky130_uuopenfpga_cc_hd_invmux2_1.lef .
cp $SOFA_PDK/sky130_uuopenfpga_cc_hd_invmux2_1_tt_025C_1v80.lib .
cp $SOFA_PDK/sky130_uuopenfpga_cc_hd_invmux2_1.v .
cp $SOFA_PDK/sky130_uuopenfpga_cc_hd_invmux3_1.lef .
cp $SOFA_PDK/sky130_uuopenfpga_cc_hd_invmux3_1_tt_025C_1v80.lib .
cp $SOFA_PDK/sky130_uuopenfpga_cc_hd_invmux3_1.v .
```

After copying, verify that LEF layer names match sky130hd conventions
(`met1`, `met2`, not `M1`, `M2`). If generated for ICC2, rename:

```bash
sed -i 's/\bM1\b/met1/g; s/\bM2\b/met2/g; s/\bM3\b/met3/g' *.lef
```
