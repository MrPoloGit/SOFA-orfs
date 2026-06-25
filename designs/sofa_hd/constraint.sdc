# SOFA HD timing constraints — 50 MHz prog_clk target
# Reference: docs/SOFA_RESEARCH.md Section 5

create_clock [get_ports prog_clk] \
    -name prog_clk \
    -period 20.0 \
    -waveform {0 10}

# Conservative I/O delays for a programmable fabric
# (The fabric I/Os are connected to test harness, not performance-critical)
set_input_delay  -clock prog_clk -max 2.0 [all_inputs]
set_input_delay  -clock prog_clk -min 0.5 [all_inputs]
set_output_delay -clock prog_clk -max 2.0 [all_outputs]
set_output_delay -clock prog_clk -min 0.5 [all_outputs]

# False path from/to SRAM configuration ports (static after programming)
# Uncomment once the correct config port names are known from fpga_top.v:
# set_false_path -from [get_ports ccff_head]
# set_false_path -to   [get_ports ccff_tail]
