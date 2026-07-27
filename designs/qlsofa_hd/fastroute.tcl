# FastRoute layer adjustments for QLSOFA HD
# W=60 fabric has heavier congestion than SOFA HD - lower-metal budgets
# tightened further to force routing to wider-pitch met4/met5.

set_global_routing_layer_adjustment met1 0.88
set_global_routing_layer_adjustment met2 0.80
set_global_routing_layer_adjustment met3 0.80
set_global_routing_layer_adjustment met4 0.95
set_global_routing_layer_adjustment met5 0.99

set_routing_layers -signal met1-met5 -clock met3-met5
