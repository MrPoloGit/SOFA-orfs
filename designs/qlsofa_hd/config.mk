export DESIGN_NAME   = fpga_top
export PLATFORM      = sky130hd

# RTL — generated from ~/SOFA/FPGA1212_QLSOFA_HD_PNR (Phase 2.9)
export VERILOG_FILES = $(wildcard $(DESIGN_DIR)/src/*.v)

export SDC_FILE      = $(DESIGN_DIR)/constraint.sdc

# Floorplan — 12x12 CLB grid, W=60, sky130hd
# W=60 is 50% more tracks than HD -> ~20% larger die estimate
# Starting: ~5.3 mm^2 (2300x2300 µm)
# See docs/SOFA_RESEARCH.md Section 6 for tuning guidance
export DIE_AREA      = 0 0 2300 2300
export CORE_AREA     = 10 10 2290 2290

export PLACE_DENSITY = 0.40

export CLOCK_PORT    = prog_clk
export CLOCK_PERIOD  = 20.0

export MIN_ROUTING_LAYER = met1
export MAX_ROUTING_LAYER = met5

export FASTROUTE_TCL = $(DESIGN_DIR)/fastroute.tcl
export PDN_TCL       = $(DESIGN_DIR)/pdn.tcl

export SYNTH_ARGS    = -nosdff
