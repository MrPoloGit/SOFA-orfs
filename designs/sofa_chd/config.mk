export DESIGN_NAME   = fpga_top
export PLATFORM      = sky130hd

# RTL — generated from ~/SOFA/FPGA1212_SOFA_CHD_PNR (Phase 2.9)
export VERILOG_FILES = $(wildcard $(DESIGN_DIR)/src/*.v)

export SDC_FILE      = $(DESIGN_DIR)/constraint.sdc

# Floorplan — 12x12 CLB grid, W=60 + CPL cells
# CPL cells are slightly more compact than std mux -> 2100x2100 starting point
# See docs/SOFA_RESEARCH.md Section 6 for tuning guidance
export DIE_AREA      = 0 0 2100 2100
export CORE_AREA     = 10 10 2090 2090

export PLACE_DENSITY = 0.40

export CLOCK_PORT    = prog_clk
export CLOCK_PERIOD  = 20.0

export MIN_ROUTING_LAYER = met1
export MAX_ROUTING_LAYER = met5

export FASTROUTE_TCL = $(DESIGN_DIR)/fastroute.tcl
export PDN_TCL       = $(DESIGN_DIR)/pdn.tcl

export SYNTH_ARGS    = -nosdff

# --- Custom CPL cells (populated in Phase 5) ---
# Paths are relative to ORFS flow/ directory when running from there.
# Adjust if running from sofa-orfs root with full path.
SOFA_ORFS_ROOT := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))/../..

export ADDITIONAL_LEFS = \
    $(SOFA_ORFS_ROOT)/custom_cells/sky130_uuopenfpga_cc_hd_invmux2_1.lef \
    $(SOFA_ORFS_ROOT)/custom_cells/sky130_uuopenfpga_cc_hd_invmux3_1.lef

export ADDITIONAL_LIBS = \
    $(SOFA_ORFS_ROOT)/custom_cells/sky130_uuopenfpga_cc_hd_invmux2_1_tt_025C_1v80.lib \
    $(SOFA_ORFS_ROOT)/custom_cells/sky130_uuopenfpga_cc_hd_invmux3_1_tt_025C_1v80.lib

# Behavioral models for Yosys synthesis
export SYNTH_CELL_MODELS = \
    $(SOFA_ORFS_ROOT)/custom_cells/sky130_uuopenfpga_cc_hd_invmux2_1.v \
    $(SOFA_ORFS_ROOT)/custom_cells/sky130_uuopenfpga_cc_hd_invmux3_1.v
