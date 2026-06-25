# SOFA CHD timing constraints — 50 MHz prog_clk target
# CPL cells provide ~27% delay improvement; timing should close more easily
# than QLSOFA HD. See docs/SOFA_RESEARCH.md Section 4.

create_clock [get_ports prog_clk] \
    -name prog_clk \
    -period 20.0 \
    -waveform {0 10}

set_input_delay  -clock prog_clk -max 2.0 [all_inputs]
set_input_delay  -clock prog_clk -min 0.5 [all_inputs]
set_output_delay -clock prog_clk -max 2.0 [all_outputs]
set_output_delay -clock prog_clk -min 0.5 [all_outputs]
