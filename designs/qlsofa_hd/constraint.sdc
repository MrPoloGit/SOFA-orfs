# QLSOFA HD timing constraints — 50 MHz prog_clk target

create_clock [get_ports prog_clk] \
    -name prog_clk \
    -period 20.0 \
    -waveform {0 10}

set_input_delay  -clock prog_clk -max 2.0 [all_inputs]
set_input_delay  -clock prog_clk -min 0.5 [all_inputs]
set_output_delay -clock prog_clk -max 2.0 [all_outputs]
set_output_delay -clock prog_clk -min 0.5 [all_outputs]
