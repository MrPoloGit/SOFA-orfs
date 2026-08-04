# PDN for QLSOFA HD on sky130hd

add_global_connection -net VDD -pin_pattern {^VDD$} -power
add_global_connection -net VSS -pin_pattern {^VSS$} -ground

set_voltage_domain -power VDD -ground VSS

define_pdn_grid -name "Core" -voltage_domains "Core"

# met1 — standard cell VDD/VSS rails (follow standard cell pin pitch)
add_pdn_stripe \
    -grid "Core" \
    -layer met1 \
    -width 0.48 \
    -followpins

# met4 vertical power stripes
add_pdn_stripe \
    -grid "Core" \
    -layer met4 \
    -width 0.48 \
    -pitch 56.0 \
    -offset 2.0

# met5 horizontal power stripes
add_pdn_stripe \
    -grid "Core" \
    -layer met5 \
    -width 1.6 \
    -pitch 56.0 \
    -offset 2.0

# Connect all layers
add_pdn_connect -grid "Core" -layers {met1 met4}
add_pdn_connect -grid "Core" -layers {met4 met5}
