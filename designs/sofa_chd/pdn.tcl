# PDN for SOFA CHD on sky130hd
# Same topology as QLSOFA HD (similar die size)

add_global_connection -net VDD -pin_pattern {^VDD$} -power
add_global_connection -net VSS -pin_pattern {^VSS$} -ground

set_voltage_domain -power VDD -ground VSS

define_pdn_grid -name "Core" -voltage_domains "Core"

add_pdn_ring \
    -grid "Core" \
    -layers {met4 met5} \
    -widths {1.6 1.6} \
    -spacings {1.6 1.6} \
    -core_offsets {2 2}

add_pdn_stripe \
    -grid "Core" \
    -layer met4 \
    -width 0.48 \
    -pitch 52.0 \
    -offset 2.0

add_pdn_stripe \
    -grid "Core" \
    -layer met5 \
    -width 1.6 \
    -pitch 52.0 \
    -offset 2.0

add_pdn_connect -grid "Core" -layers {met4 met5}
