export DESIGN_NAME   = fpga_top
export PLATFORM      = sky130hd

# RTL — copied from sofa/ submodule (see repo README)
# Excludes include wrappers (fabric_netlists.v, top_include_netlists.v)
# and the Caravel SoC stub (sub_module/fpga_top.v)
export VERILOG_FILES = $(filter-out \
  %fabric_netlists.v %top_include_netlists.v %sub_module/fpga_top.v, \
  $(shell find $(DESIGN_DIR)/src -name "*.v" 2>/dev/null))

# SDC from the original SOFA tapeout — copied from the SOFA repo SRC/ dir
# alongside the RTL (see README setup step 7 / plan.md Task 2.7)
export SDC_FILE      = $(DESIGN_DIR)/src/fpga_top.sdc

# Floorplan - 12x12 CLB grid, W=40, sky130hd
# Starting estimate: ~3.6 mm^2  (1900x1900 µm)
# See docs/SOFA_RESEARCH.md Section 6 for escalation ladder if routing fails
export DIE_AREA      = 0 0 1900 1900
export CORE_AREA     = 10 10 1890 1890

# Placement - FPGA mux trees need breathing room; start conservative
export PLACE_DENSITY = 0.40

# Clock
export CLOCK_PORT    = prog_clk
export CLOCK_PERIOD  = 20.0

# Routing layers: sky130hd has met1–met5; use all of them
export MIN_ROUTING_LAYER = met1
export MAX_ROUTING_LAYER = met5

# Per-layer capacity adjustments (heavy routing fabric benefits from upper metals)
export FASTROUTE_TCL = $(DESIGN_DIR)/fastroute.tcl

# Power delivery
export PDN_TCL       = $(DESIGN_DIR)/pdn.tcl

# Synthesis flags for OpenFPGA-generated RTL
# -nosdff: prevent latch inference from combinational switch-box RTL
export SYNTH_ARGS    = -nosdff
