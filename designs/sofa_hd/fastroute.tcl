# FastRoute layer adjustments for SOFA HD
#
# FPGA fabrics have extreme horizontal/vertical routing density from mux trees.
# Push congested routing to upper metals (met4, met5) which have wider pitches
# and more capacity.
#
# Adjust individual layer multipliers based on congestion heatmap results

# Reduce lower-metal capacity to steer router toward upper layers
set_global_routing_layer_adjustment met1 0.90
set_global_routing_layer_adjustment met2 0.85
set_global_routing_layer_adjustment met3 0.85
set_global_routing_layer_adjustment met4 0.95
set_global_routing_layer_adjustment met5 0.99

# Route signals on met1–met5, clock preferred on met3–met5
set_routing_layers -signal met1-met5 -clock met3-met5
