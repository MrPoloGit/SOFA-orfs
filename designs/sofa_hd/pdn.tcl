# PDN for SOFA HD on sky130hd
#
# The sky130hd ORFS platform already inserts VDD/VSS rails on met1 for
# standard cells. This script adds met4/met5 power stripes for the large
# (~3.6 mm^2) SOFA die.
#
# Adjust stripe pitch if DRC violations appear on met1 near power rings -
# see docs/SOFA_RESEARCH.md Section 8.

add_global_connection -net VDD -pin_pattern {^VDD$} -power
add_global_connection -net VSS -pin_pattern {^VSS$} -ground

set_voltage_domain -power VDD -ground VSS

define_pdn_grid -name "Core" -voltage_domains "Core"

# Power ring around the core on met4/met5
add_pdn_ring \
    -grid "Core" \
    -layers {met4 met5} \
    -widths {1.6 1.6} \
    -spacings {1.6 1.6} \
    -core_offsets {2 2}

# met4 vertical stripes (pitch 56 µm ≈ one stripe per ~14 CLBs wide)
add_pdn_stripe \
    -grid "Core" \
    -layer met4 \
    -width 0.48 \
    -pitch 56.0 \
    -offset 2.0

# met5 horizontal stripes
add_pdn_stripe \
    -grid "Core" \
    -layer met5 \
    -width 1.6 \
    -pitch 56.0 \
    -offset 2.0

add_pdn_connect -grid "Core" -layers {met4 met5}
