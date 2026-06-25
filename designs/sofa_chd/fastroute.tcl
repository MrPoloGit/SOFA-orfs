# FastRoute layer adjustments for SOFA CHD
# CPL cells are slightly more compact, reducing peak congestion vs QLSOFA HD.
# Same layer budget as HD variant as a starting point.

set_global_routing_layer_adjustment met1 0.90
set_global_routing_layer_adjustment met2 0.85
set_global_routing_layer_adjustment met3 0.85
set_global_routing_layer_adjustment met4 0.95
set_global_routing_layer_adjustment met5 0.99

set_routing_layers -signal met1-met5 -clock met3-met5
