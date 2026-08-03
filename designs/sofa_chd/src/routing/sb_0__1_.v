//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for Unique Switch Blocks[0][1]
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Aug  3 09:22:00 2026
//-------------------------------------------
//----- Default net type -----
`default_nettype none

// ----- Verilog module for sb_0__1_ -----
module sb_0__1_(pReset,
                prog_clk,
                chany_top_in,
                top_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_,
                chanx_right_in,
                right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_,
                right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_,
                right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_,
                right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_,
                right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_,
                right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_,
                right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_6_,
                right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_7_,
                chany_bottom_in,
                bottom_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_,
                ccff_head,
                chany_top_out,
                chanx_right_out,
                chany_bottom_out,
                ccff_tail);
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:29] chany_top_in;
//----- INPUT PORTS -----
input [0:0] top_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_;
//----- INPUT PORTS -----
input [0:29] chanx_right_in;
//----- INPUT PORTS -----
input [0:0] right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_;
//----- INPUT PORTS -----
input [0:0] right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_;
//----- INPUT PORTS -----
input [0:0] right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_;
//----- INPUT PORTS -----
input [0:0] right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_;
//----- INPUT PORTS -----
input [0:0] right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_;
//----- INPUT PORTS -----
input [0:0] right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_;
//----- INPUT PORTS -----
input [0:0] right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_6_;
//----- INPUT PORTS -----
input [0:0] right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_7_;
//----- INPUT PORTS -----
input [0:29] chany_bottom_in;
//----- INPUT PORTS -----
input [0:0] bottom_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:29] chany_top_out;
//----- OUTPUT PORTS -----
output [0:29] chanx_right_out;
//----- OUTPUT PORTS -----
output [0:29] chany_bottom_out;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:1] mux_2level_tapbuf_size2_0_sram;
wire [0:1] mux_2level_tapbuf_size2_1_sram;
wire [0:1] mux_2level_tapbuf_size2_2_sram;
wire [0:1] mux_2level_tapbuf_size2_3_sram;
wire [0:1] mux_2level_tapbuf_size2_4_sram;
wire [0:1] mux_2level_tapbuf_size2_5_sram;
wire [0:0] mux_2level_tapbuf_size2_mem_0_ccff_tail;
wire [0:0] mux_2level_tapbuf_size2_mem_1_ccff_tail;
wire [0:0] mux_2level_tapbuf_size2_mem_2_ccff_tail;
wire [0:0] mux_2level_tapbuf_size2_mem_3_ccff_tail;
wire [0:0] mux_2level_tapbuf_size2_mem_4_ccff_tail;
wire [0:1] mux_2level_tapbuf_size3_0_sram;
wire [0:1] mux_2level_tapbuf_size3_10_sram;
wire [0:1] mux_2level_tapbuf_size3_11_sram;
wire [0:1] mux_2level_tapbuf_size3_12_sram;
wire [0:1] mux_2level_tapbuf_size3_13_sram;
wire [0:1] mux_2level_tapbuf_size3_14_sram;
wire [0:1] mux_2level_tapbuf_size3_15_sram;
wire [0:1] mux_2level_tapbuf_size3_16_sram;
wire [0:1] mux_2level_tapbuf_size3_17_sram;
wire [0:1] mux_2level_tapbuf_size3_18_sram;
wire [0:1] mux_2level_tapbuf_size3_19_sram;
wire [0:1] mux_2level_tapbuf_size3_1_sram;
wire [0:1] mux_2level_tapbuf_size3_20_sram;
wire [0:1] mux_2level_tapbuf_size3_21_sram;
wire [0:1] mux_2level_tapbuf_size3_22_sram;
wire [0:1] mux_2level_tapbuf_size3_23_sram;
wire [0:1] mux_2level_tapbuf_size3_24_sram;
wire [0:1] mux_2level_tapbuf_size3_25_sram;
wire [0:1] mux_2level_tapbuf_size3_26_sram;
wire [0:1] mux_2level_tapbuf_size3_27_sram;
wire [0:1] mux_2level_tapbuf_size3_28_sram;
wire [0:1] mux_2level_tapbuf_size3_29_sram;
wire [0:1] mux_2level_tapbuf_size3_2_sram;
wire [0:1] mux_2level_tapbuf_size3_3_sram;
wire [0:1] mux_2level_tapbuf_size3_4_sram;
wire [0:1] mux_2level_tapbuf_size3_5_sram;
wire [0:1] mux_2level_tapbuf_size3_6_sram;
wire [0:1] mux_2level_tapbuf_size3_7_sram;
wire [0:1] mux_2level_tapbuf_size3_8_sram;
wire [0:1] mux_2level_tapbuf_size3_9_sram;
wire [0:0] mux_2level_tapbuf_size3_mem_0_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_10_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_11_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_12_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_13_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_14_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_15_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_16_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_17_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_18_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_19_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_1_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_20_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_21_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_22_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_23_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_24_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_25_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_26_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_27_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_28_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_29_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_2_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_3_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_4_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_5_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_6_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_7_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_8_ccff_tail;
wire [0:0] mux_2level_tapbuf_size3_mem_9_ccff_tail;
wire [0:3] mux_2level_tapbuf_size4_0_sram;
wire [0:3] mux_2level_tapbuf_size4_10_sram;
wire [0:3] mux_2level_tapbuf_size4_11_sram;
wire [0:3] mux_2level_tapbuf_size4_1_sram;
wire [0:3] mux_2level_tapbuf_size4_2_sram;
wire [0:3] mux_2level_tapbuf_size4_3_sram;
wire [0:3] mux_2level_tapbuf_size4_4_sram;
wire [0:3] mux_2level_tapbuf_size4_5_sram;
wire [0:3] mux_2level_tapbuf_size4_6_sram;
wire [0:3] mux_2level_tapbuf_size4_7_sram;
wire [0:3] mux_2level_tapbuf_size4_8_sram;
wire [0:3] mux_2level_tapbuf_size4_9_sram;
wire [0:0] mux_2level_tapbuf_size4_mem_0_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_10_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_11_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_1_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_2_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_3_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_4_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_5_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_6_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_7_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_8_ccff_tail;
wire [0:0] mux_2level_tapbuf_size4_mem_9_ccff_tail;
wire [0:3] mux_2level_tapbuf_size5_0_sram;
wire [0:3] mux_2level_tapbuf_size5_1_sram;
wire [0:3] mux_2level_tapbuf_size5_2_sram;
wire [0:0] mux_2level_tapbuf_size5_mem_0_ccff_tail;
wire [0:0] mux_2level_tapbuf_size5_mem_1_ccff_tail;
wire [0:0] mux_2level_tapbuf_size5_mem_2_ccff_tail;
wire [0:1] mux_bottom_track_11_undriven_sram_inv;
wire [0:3] mux_bottom_track_13_undriven_sram_inv;
wire [0:1] mux_bottom_track_1_undriven_sram_inv;
wire [0:1] mux_bottom_track_21_undriven_sram_inv;
wire [0:1] mux_bottom_track_29_undriven_sram_inv;
wire [0:1] mux_bottom_track_37_undriven_sram_inv;
wire [0:1] mux_bottom_track_3_undriven_sram_inv;
wire [0:1] mux_bottom_track_45_undriven_sram_inv;
wire [0:1] mux_bottom_track_53_undriven_sram_inv;
wire [0:1] mux_bottom_track_5_undriven_sram_inv;
wire [0:3] mux_bottom_track_7_undriven_sram_inv;
wire [0:1] mux_right_track_0_undriven_sram_inv;
wire [0:3] mux_right_track_10_undriven_sram_inv;
wire [0:1] mux_right_track_12_undriven_sram_inv;
wire [0:1] mux_right_track_14_undriven_sram_inv;
wire [0:1] mux_right_track_16_undriven_sram_inv;
wire [0:1] mux_right_track_18_undriven_sram_inv;
wire [0:3] mux_right_track_20_undriven_sram_inv;
wire [0:3] mux_right_track_22_undriven_sram_inv;
wire [0:1] mux_right_track_24_undriven_sram_inv;
wire [0:1] mux_right_track_26_undriven_sram_inv;
wire [0:1] mux_right_track_28_undriven_sram_inv;
wire [0:3] mux_right_track_2_undriven_sram_inv;
wire [0:1] mux_right_track_30_undriven_sram_inv;
wire [0:1] mux_right_track_32_undriven_sram_inv;
wire [0:1] mux_right_track_34_undriven_sram_inv;
wire [0:3] mux_right_track_36_undriven_sram_inv;
wire [0:3] mux_right_track_38_undriven_sram_inv;
wire [0:1] mux_right_track_40_undriven_sram_inv;
wire [0:1] mux_right_track_42_undriven_sram_inv;
wire [0:1] mux_right_track_44_undriven_sram_inv;
wire [0:1] mux_right_track_46_undriven_sram_inv;
wire [0:1] mux_right_track_48_undriven_sram_inv;
wire [0:3] mux_right_track_4_undriven_sram_inv;
wire [0:3] mux_right_track_50_undriven_sram_inv;
wire [0:1] mux_right_track_52_undriven_sram_inv;
wire [0:1] mux_right_track_54_undriven_sram_inv;
wire [0:1] mux_right_track_56_undriven_sram_inv;
wire [0:3] mux_right_track_6_undriven_sram_inv;
wire [0:3] mux_right_track_8_undriven_sram_inv;
wire [0:3] mux_top_track_0_undriven_sram_inv;
wire [0:1] mux_top_track_10_undriven_sram_inv;
wire [0:3] mux_top_track_12_undriven_sram_inv;
wire [0:1] mux_top_track_20_undriven_sram_inv;
wire [0:1] mux_top_track_28_undriven_sram_inv;
wire [0:1] mux_top_track_2_undriven_sram_inv;
wire [0:1] mux_top_track_36_undriven_sram_inv;
wire [0:1] mux_top_track_44_undriven_sram_inv;
wire [0:1] mux_top_track_4_undriven_sram_inv;
wire [0:1] mux_top_track_52_undriven_sram_inv;
wire [0:3] mux_top_track_6_undriven_sram_inv;

// ----- BEGIN Local short connections -----
// ----- Local connection due to Wire 3 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[4] = chany_top_in[3];
// ----- Local connection due to Wire 6 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[7] = chany_top_in[6];
// ----- Local connection due to Wire 7 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[8] = chany_top_in[7];
// ----- Local connection due to Wire 8 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[9] = chany_top_in[8];
// ----- Local connection due to Wire 10 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[11] = chany_top_in[10];
// ----- Local connection due to Wire 11 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[12] = chany_top_in[11];
// ----- Local connection due to Wire 12 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[13] = chany_top_in[12];
// ----- Local connection due to Wire 14 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[15] = chany_top_in[14];
// ----- Local connection due to Wire 15 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[16] = chany_top_in[15];
// ----- Local connection due to Wire 16 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[17] = chany_top_in[16];
// ----- Local connection due to Wire 18 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[19] = chany_top_in[18];
// ----- Local connection due to Wire 19 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[20] = chany_top_in[19];
// ----- Local connection due to Wire 20 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[21] = chany_top_in[20];
// ----- Local connection due to Wire 22 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[23] = chany_top_in[22];
// ----- Local connection due to Wire 23 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[24] = chany_top_in[23];
// ----- Local connection due to Wire 24 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[25] = chany_top_in[24];
// ----- Local connection due to Wire 26 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[27] = chany_top_in[26];
// ----- Local connection due to Wire 27 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[28] = chany_top_in[27];
// ----- Local connection due to Wire 28 -----
// ----- Net source id 0 -----
// ----- Net sink id 1 -----
	assign chany_bottom_out[29] = chany_top_in[28];
// ----- Local connection due to Wire 72 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[4] = chany_bottom_in[3];
// ----- Local connection due to Wire 75 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[7] = chany_bottom_in[6];
// ----- Local connection due to Wire 76 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[8] = chany_bottom_in[7];
// ----- Local connection due to Wire 77 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[9] = chany_bottom_in[8];
// ----- Local connection due to Wire 79 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[11] = chany_bottom_in[10];
// ----- Local connection due to Wire 80 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[12] = chany_bottom_in[11];
// ----- Local connection due to Wire 81 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[13] = chany_bottom_in[12];
// ----- Local connection due to Wire 83 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[15] = chany_bottom_in[14];
// ----- Local connection due to Wire 84 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[16] = chany_bottom_in[15];
// ----- Local connection due to Wire 85 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[17] = chany_bottom_in[16];
// ----- Local connection due to Wire 87 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[19] = chany_bottom_in[18];
// ----- Local connection due to Wire 88 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[20] = chany_bottom_in[19];
// ----- Local connection due to Wire 89 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[21] = chany_bottom_in[20];
// ----- Local connection due to Wire 91 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[23] = chany_bottom_in[22];
// ----- Local connection due to Wire 92 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[24] = chany_bottom_in[23];
// ----- Local connection due to Wire 93 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[25] = chany_bottom_in[24];
// ----- Local connection due to Wire 95 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[27] = chany_bottom_in[26];
// ----- Local connection due to Wire 96 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[28] = chany_bottom_in[27];
// ----- Local connection due to Wire 97 -----
// ----- Net source id 0 -----
// ----- Net sink id 0 -----
	assign chany_top_out[29] = chany_bottom_in[28];
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	mux_2level_tapbuf_size4 mux_top_track_0 (
		.in({top_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_, chanx_right_in[1], chanx_right_in[12], chanx_right_in[23]}),
		.sram(mux_2level_tapbuf_size4_0_sram[0:3]),
		.sram_inv(mux_top_track_0_undriven_sram_inv[0:3]),
		.out(chany_top_out[0]));

	mux_2level_tapbuf_size4 mux_top_track_6 (
		.in({top_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_, chanx_right_in[4], chanx_right_in[15], chanx_right_in[26]}),
		.sram(mux_2level_tapbuf_size4_1_sram[0:3]),
		.sram_inv(mux_top_track_6_undriven_sram_inv[0:3]),
		.out(chany_top_out[3]));

	mux_2level_tapbuf_size4 mux_top_track_12 (
		.in({top_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_, chanx_right_in[6], chanx_right_in[17], chanx_right_in[28]}),
		.sram(mux_2level_tapbuf_size4_2_sram[0:3]),
		.sram_inv(mux_top_track_12_undriven_sram_inv[0:3]),
		.out(chany_top_out[6]));

	mux_2level_tapbuf_size4 mux_right_track_4 (
		.in({chany_top_in[1], chany_top_in[6], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_}),
		.sram(mux_2level_tapbuf_size4_3_sram[0:3]),
		.sram_inv(mux_right_track_4_undriven_sram_inv[0:3]),
		.out(chanx_right_out[2]));

	mux_2level_tapbuf_size4 mux_right_track_10 (
		.in({chany_top_in[5], chany_top_in[10], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_}),
		.sram(mux_2level_tapbuf_size4_4_sram[0:3]),
		.sram_inv(mux_right_track_10_undriven_sram_inv[0:3]),
		.out(chanx_right_out[5]));

	mux_2level_tapbuf_size4 mux_right_track_20 (
		.in({chany_top_in[16], chany_top_in[25], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_, chany_bottom_in[28]}),
		.sram(mux_2level_tapbuf_size4_5_sram[0:3]),
		.sram_inv(mux_right_track_20_undriven_sram_inv[0:3]),
		.out(chanx_right_out[10]));

	mux_2level_tapbuf_size4 mux_right_track_22 (
		.in({chany_top_in[18], chany_top_in[29], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_, chany_bottom_in[27]}),
		.sram(mux_2level_tapbuf_size4_6_sram[0:3]),
		.sram_inv(mux_right_track_22_undriven_sram_inv[0:3]),
		.out(chanx_right_out[11]));

	mux_2level_tapbuf_size4 mux_right_track_36 (
		.in({chany_top_in[27], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_, chany_bottom_in[18], chany_bottom_in[29]}),
		.sram(mux_2level_tapbuf_size4_7_sram[0:3]),
		.sram_inv(mux_right_track_36_undriven_sram_inv[0:3]),
		.out(chanx_right_out[18]));

	mux_2level_tapbuf_size4 mux_right_track_38 (
		.in({chany_top_in[28], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_, chany_bottom_in[16], chany_bottom_in[25]}),
		.sram(mux_2level_tapbuf_size4_8_sram[0:3]),
		.sram_inv(mux_right_track_38_undriven_sram_inv[0:3]),
		.out(chanx_right_out[19]));

	mux_2level_tapbuf_size4 mux_right_track_50 (
		.in({right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_7_, chany_bottom_in[4], chany_bottom_in[8]}),
		.sram(mux_2level_tapbuf_size4_9_sram[0:3]),
		.sram_inv(mux_right_track_50_undriven_sram_inv[0:3]),
		.out(chanx_right_out[25]));

	mux_2level_tapbuf_size4 mux_bottom_track_7 (
		.in({chanx_right_in[6], chanx_right_in[17], chanx_right_in[28], bottom_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_}),
		.sram(mux_2level_tapbuf_size4_10_sram[0:3]),
		.sram_inv(mux_bottom_track_7_undriven_sram_inv[0:3]),
		.out(chany_bottom_out[3]));

	mux_2level_tapbuf_size4 mux_bottom_track_13 (
		.in({chanx_right_in[4], chanx_right_in[15], chanx_right_in[26], bottom_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_}),
		.sram(mux_2level_tapbuf_size4_11_sram[0:3]),
		.sram_inv(mux_bottom_track_13_undriven_sram_inv[0:3]),
		.out(chany_bottom_out[6]));

	mux_2level_tapbuf_size4_mem mem_top_track_0 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(ccff_head),
		.ccff_tail(mux_2level_tapbuf_size4_mem_0_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_0_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_top_track_6 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_1_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_1_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_1_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_top_track_12 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_2_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_2_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_2_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_right_track_4 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size5_mem_0_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_3_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_3_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_right_track_10 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size5_mem_2_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_4_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_4_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_right_track_20 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_9_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_5_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_5_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_right_track_22 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_5_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_6_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_6_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_right_track_36 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_15_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_7_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_7_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_right_track_38 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_7_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_8_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_8_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_right_track_50 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_19_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_9_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_9_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_bottom_track_7 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_24_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_10_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_10_sram[0:3]));

	mux_2level_tapbuf_size4_mem mem_bottom_track_13 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_25_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size4_mem_11_ccff_tail),
		.mem_out(mux_2level_tapbuf_size4_11_sram[0:3]));

	mux_2level_tapbuf_size3 mux_top_track_2 (
		.in({chanx_right_in[2], chanx_right_in[13], chanx_right_in[24]}),
		.sram(mux_2level_tapbuf_size3_0_sram[0:1]),
		.sram_inv(mux_top_track_2_undriven_sram_inv[0:1]),
		.out(chany_top_out[1]));

	mux_2level_tapbuf_size3 mux_top_track_4 (
		.in({chanx_right_in[3], chanx_right_in[14], chanx_right_in[25]}),
		.sram(mux_2level_tapbuf_size3_1_sram[0:1]),
		.sram_inv(mux_top_track_4_undriven_sram_inv[0:1]),
		.out(chany_top_out[2]));

	mux_2level_tapbuf_size3 mux_top_track_10 (
		.in({chanx_right_in[5], chanx_right_in[16], chanx_right_in[27]}),
		.sram(mux_2level_tapbuf_size3_2_sram[0:1]),
		.sram_inv(mux_top_track_10_undriven_sram_inv[0:1]),
		.out(chany_top_out[5]));

	mux_2level_tapbuf_size3 mux_top_track_20 (
		.in({chanx_right_in[7], chanx_right_in[18], chanx_right_in[29]}),
		.sram(mux_2level_tapbuf_size3_3_sram[0:1]),
		.sram_inv(mux_top_track_20_undriven_sram_inv[0:1]),
		.out(chany_top_out[10]));

	mux_2level_tapbuf_size3 mux_top_track_52 (
		.in({chanx_right_in[0], chanx_right_in[11], chanx_right_in[22]}),
		.sram(mux_2level_tapbuf_size3_4_sram[0:1]),
		.sram_inv(mux_top_track_52_undriven_sram_inv[0:1]),
		.out(chany_top_out[26]));

	mux_2level_tapbuf_size3 mux_right_track_0 (
		.in({right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_6_}),
		.sram(mux_2level_tapbuf_size3_5_sram[0:1]),
		.sram_inv(mux_right_track_0_undriven_sram_inv[0:1]),
		.out(chanx_right_out[0]));

	mux_2level_tapbuf_size3 mux_right_track_12 (
		.in({chany_top_in[9], chany_top_in[11], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_}),
		.sram(mux_2level_tapbuf_size3_6_sram[0:1]),
		.sram_inv(mux_right_track_12_undriven_sram_inv[0:1]),
		.out(chanx_right_out[6]));

	mux_2level_tapbuf_size3 mux_right_track_14 (
		.in({chany_top_in[12:13], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_}),
		.sram(mux_2level_tapbuf_size3_7_sram[0:1]),
		.sram_inv(mux_right_track_14_undriven_sram_inv[0:1]),
		.out(chanx_right_out[7]));

	mux_2level_tapbuf_size3 mux_right_track_16 (
		.in({chany_top_in[14], chany_top_in[17], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_}),
		.sram(mux_2level_tapbuf_size3_8_sram[0:1]),
		.sram_inv(mux_right_track_16_undriven_sram_inv[0:1]),
		.out(chanx_right_out[8]));

	mux_2level_tapbuf_size3 mux_right_track_18 (
		.in({chany_top_in[15], chany_top_in[21], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_}),
		.sram(mux_2level_tapbuf_size3_9_sram[0:1]),
		.sram_inv(mux_right_track_18_undriven_sram_inv[0:1]),
		.out(chanx_right_out[9]));

	mux_2level_tapbuf_size3 mux_right_track_24 (
		.in({chany_top_in[19], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_6_, chany_bottom_in[26]}),
		.sram(mux_2level_tapbuf_size3_10_sram[0:1]),
		.sram_inv(mux_right_track_24_undriven_sram_inv[0:1]),
		.out(chanx_right_out[12]));

	mux_2level_tapbuf_size3 mux_right_track_26 (
		.in({chany_top_in[20], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_7_, chany_bottom_in[24]}),
		.sram(mux_2level_tapbuf_size3_11_sram[0:1]),
		.sram_inv(mux_right_track_26_undriven_sram_inv[0:1]),
		.out(chanx_right_out[13]));

	mux_2level_tapbuf_size3 mux_right_track_28 (
		.in({chany_top_in[22], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_, chany_bottom_in[23]}),
		.sram(mux_2level_tapbuf_size3_12_sram[0:1]),
		.sram_inv(mux_right_track_28_undriven_sram_inv[0:1]),
		.out(chanx_right_out[14]));

	mux_2level_tapbuf_size3 mux_right_track_30 (
		.in({chany_top_in[23], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_, chany_bottom_in[22]}),
		.sram(mux_2level_tapbuf_size3_13_sram[0:1]),
		.sram_inv(mux_right_track_30_undriven_sram_inv[0:1]),
		.out(chanx_right_out[15]));

	mux_2level_tapbuf_size3 mux_right_track_32 (
		.in({chany_top_in[24], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_, chany_bottom_in[20]}),
		.sram(mux_2level_tapbuf_size3_14_sram[0:1]),
		.sram_inv(mux_right_track_32_undriven_sram_inv[0:1]),
		.out(chanx_right_out[16]));

	mux_2level_tapbuf_size3 mux_right_track_34 (
		.in({chany_top_in[26], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_, chany_bottom_in[19]}),
		.sram(mux_2level_tapbuf_size3_15_sram[0:1]),
		.sram_inv(mux_right_track_34_undriven_sram_inv[0:1]),
		.out(chanx_right_out[17]));

	mux_2level_tapbuf_size3 mux_right_track_40 (
		.in({right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_6_, chany_bottom_in[15], chany_bottom_in[21]}),
		.sram(mux_2level_tapbuf_size3_16_sram[0:1]),
		.sram_inv(mux_right_track_40_undriven_sram_inv[0:1]),
		.out(chanx_right_out[20]));

	mux_2level_tapbuf_size3 mux_right_track_44 (
		.in({right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_, chany_bottom_in[12:13]}),
		.sram(mux_2level_tapbuf_size3_17_sram[0:1]),
		.sram_inv(mux_right_track_44_undriven_sram_inv[0:1]),
		.out(chanx_right_out[22]));

	mux_2level_tapbuf_size3 mux_right_track_46 (
		.in({right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_, chany_bottom_in[9], chany_bottom_in[11]}),
		.sram(mux_2level_tapbuf_size3_18_sram[0:1]),
		.sram_inv(mux_right_track_46_undriven_sram_inv[0:1]),
		.out(chanx_right_out[23]));

	mux_2level_tapbuf_size3 mux_right_track_48 (
		.in({right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_, chany_bottom_in[5], chany_bottom_in[10]}),
		.sram(mux_2level_tapbuf_size3_19_sram[0:1]),
		.sram_inv(mux_right_track_48_undriven_sram_inv[0:1]),
		.out(chanx_right_out[24]));

	mux_2level_tapbuf_size3 mux_right_track_52 (
		.in({right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_, chany_bottom_in[2], chany_bottom_in[7]}),
		.sram(mux_2level_tapbuf_size3_20_sram[0:1]),
		.sram_inv(mux_right_track_52_undriven_sram_inv[0:1]),
		.out(chanx_right_out[26]));

	mux_2level_tapbuf_size3 mux_right_track_54 (
		.in({right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_, chany_bottom_in[1], chany_bottom_in[6]}),
		.sram(mux_2level_tapbuf_size3_21_sram[0:1]),
		.sram_inv(mux_right_track_54_undriven_sram_inv[0:1]),
		.out(chanx_right_out[27]));

	mux_2level_tapbuf_size3 mux_right_track_56 (
		.in({right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_6_, chany_bottom_in[0], chany_bottom_in[3]}),
		.sram(mux_2level_tapbuf_size3_22_sram[0:1]),
		.sram_inv(mux_right_track_56_undriven_sram_inv[0:1]),
		.out(chanx_right_out[28]));

	mux_2level_tapbuf_size3 mux_bottom_track_1 (
		.in({chanx_right_in[9], chanx_right_in[20], bottom_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_}),
		.sram(mux_2level_tapbuf_size3_23_sram[0:1]),
		.sram_inv(mux_bottom_track_1_undriven_sram_inv[0:1]),
		.out(chany_bottom_out[0]));

	mux_2level_tapbuf_size3 mux_bottom_track_5 (
		.in({chanx_right_in[7], chanx_right_in[18], chanx_right_in[29]}),
		.sram(mux_2level_tapbuf_size3_24_sram[0:1]),
		.sram_inv(mux_bottom_track_5_undriven_sram_inv[0:1]),
		.out(chany_bottom_out[2]));

	mux_2level_tapbuf_size3 mux_bottom_track_11 (
		.in({chanx_right_in[5], chanx_right_in[16], chanx_right_in[27]}),
		.sram(mux_2level_tapbuf_size3_25_sram[0:1]),
		.sram_inv(mux_bottom_track_11_undriven_sram_inv[0:1]),
		.out(chany_bottom_out[5]));

	mux_2level_tapbuf_size3 mux_bottom_track_21 (
		.in({chanx_right_in[3], chanx_right_in[14], chanx_right_in[25]}),
		.sram(mux_2level_tapbuf_size3_26_sram[0:1]),
		.sram_inv(mux_bottom_track_21_undriven_sram_inv[0:1]),
		.out(chany_bottom_out[10]));

	mux_2level_tapbuf_size3 mux_bottom_track_29 (
		.in({chanx_right_in[2], chanx_right_in[13], chanx_right_in[24]}),
		.sram(mux_2level_tapbuf_size3_27_sram[0:1]),
		.sram_inv(mux_bottom_track_29_undriven_sram_inv[0:1]),
		.out(chany_bottom_out[14]));

	mux_2level_tapbuf_size3 mux_bottom_track_37 (
		.in({chanx_right_in[1], chanx_right_in[12], chanx_right_in[23]}),
		.sram(mux_2level_tapbuf_size3_28_sram[0:1]),
		.sram_inv(mux_bottom_track_37_undriven_sram_inv[0:1]),
		.out(chany_bottom_out[18]));

	mux_2level_tapbuf_size3 mux_bottom_track_45 (
		.in({chanx_right_in[0], chanx_right_in[11], chanx_right_in[22]}),
		.sram(mux_2level_tapbuf_size3_29_sram[0:1]),
		.sram_inv(mux_bottom_track_45_undriven_sram_inv[0:1]),
		.out(chany_bottom_out[22]));

	mux_2level_tapbuf_size3_mem mem_top_track_2 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_0_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_0_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_0_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_top_track_4 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_0_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_1_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_1_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_top_track_10 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_1_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_2_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_2_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_top_track_20 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_2_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_3_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_3_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_top_track_52 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size2_mem_2_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_4_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_4_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_0 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_4_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_5_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_5_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_12 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_4_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_6_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_6_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_14 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_6_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_7_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_7_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_16 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_7_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_8_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_8_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_18 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_8_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_9_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_9_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_24 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_6_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_10_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_10_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_26 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_10_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_11_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_11_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_28 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_11_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_12_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_12_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_30 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_12_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_13_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_13_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_32 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_13_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_14_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_14_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_34 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_14_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_15_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_15_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_40 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_8_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_16_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_16_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_44 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size2_mem_3_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_17_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_17_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_46 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_17_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_18_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_18_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_48 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_18_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_19_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_19_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_52 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_9_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_20_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_20_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_54 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_20_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_21_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_21_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_right_track_56 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_21_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_22_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_22_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_bottom_track_1 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_22_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_23_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_23_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_bottom_track_5 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size2_mem_4_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_24_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_24_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_bottom_track_11 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_10_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_25_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_25_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_bottom_track_21 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_11_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_26_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_26_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_bottom_track_29 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_26_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_27_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_27_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_bottom_track_37 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_27_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_28_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_28_sram[0:1]));

	mux_2level_tapbuf_size3_mem mem_bottom_track_45 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_28_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size3_mem_29_ccff_tail),
		.mem_out(mux_2level_tapbuf_size3_29_sram[0:1]));

	mux_2level_tapbuf_size2 mux_top_track_28 (
		.in({chanx_right_in[8], chanx_right_in[19]}),
		.sram(mux_2level_tapbuf_size2_0_sram[0:1]),
		.sram_inv(mux_top_track_28_undriven_sram_inv[0:1]),
		.out(chany_top_out[14]));

	mux_2level_tapbuf_size2 mux_top_track_36 (
		.in({chanx_right_in[9], chanx_right_in[20]}),
		.sram(mux_2level_tapbuf_size2_1_sram[0:1]),
		.sram_inv(mux_top_track_36_undriven_sram_inv[0:1]),
		.out(chany_top_out[18]));

	mux_2level_tapbuf_size2 mux_top_track_44 (
		.in({chanx_right_in[10], chanx_right_in[21]}),
		.sram(mux_2level_tapbuf_size2_2_sram[0:1]),
		.sram_inv(mux_top_track_44_undriven_sram_inv[0:1]),
		.out(chany_top_out[22]));

	mux_2level_tapbuf_size2 mux_right_track_42 (
		.in({chany_bottom_in[14], chany_bottom_in[17]}),
		.sram(mux_2level_tapbuf_size2_3_sram[0:1]),
		.sram_inv(mux_right_track_42_undriven_sram_inv[0:1]),
		.out(chanx_right_out[21]));

	mux_2level_tapbuf_size2 mux_bottom_track_3 (
		.in({chanx_right_in[8], chanx_right_in[19]}),
		.sram(mux_2level_tapbuf_size2_4_sram[0:1]),
		.sram_inv(mux_bottom_track_3_undriven_sram_inv[0:1]),
		.out(chany_bottom_out[1]));

	mux_2level_tapbuf_size2 mux_bottom_track_53 (
		.in({chanx_right_in[10], chanx_right_in[21]}),
		.sram(mux_2level_tapbuf_size2_5_sram[0:1]),
		.sram_inv(mux_bottom_track_53_undriven_sram_inv[0:1]),
		.out(chany_bottom_out[26]));

	mux_2level_tapbuf_size2_mem mem_top_track_28 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_3_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size2_mem_0_ccff_tail),
		.mem_out(mux_2level_tapbuf_size2_0_sram[0:1]));

	mux_2level_tapbuf_size2_mem mem_top_track_36 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size2_mem_0_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size2_mem_1_ccff_tail),
		.mem_out(mux_2level_tapbuf_size2_1_sram[0:1]));

	mux_2level_tapbuf_size2_mem mem_top_track_44 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size2_mem_1_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size2_mem_2_ccff_tail),
		.mem_out(mux_2level_tapbuf_size2_2_sram[0:1]));

	mux_2level_tapbuf_size2_mem mem_right_track_42 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_16_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size2_mem_3_ccff_tail),
		.mem_out(mux_2level_tapbuf_size2_3_sram[0:1]));

	mux_2level_tapbuf_size2_mem mem_bottom_track_3 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_23_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size2_mem_4_ccff_tail),
		.mem_out(mux_2level_tapbuf_size2_4_sram[0:1]));

	mux_2level_tapbuf_size2_mem mem_bottom_track_53 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_29_ccff_tail),
		.ccff_tail(ccff_tail),
		.mem_out(mux_2level_tapbuf_size2_5_sram[0:1]));

	mux_2level_tapbuf_size5 mux_right_track_2 (
		.in({chany_top_in[0], chany_top_in[3], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_7_}),
		.sram(mux_2level_tapbuf_size5_0_sram[0:3]),
		.sram_inv(mux_right_track_2_undriven_sram_inv[0:3]),
		.out(chanx_right_out[1]));

	mux_2level_tapbuf_size5 mux_right_track_6 (
		.in({chany_top_in[2], chany_top_in[7], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_6_}),
		.sram(mux_2level_tapbuf_size5_1_sram[0:3]),
		.sram_inv(mux_right_track_6_undriven_sram_inv[0:3]),
		.out(chanx_right_out[3]));

	mux_2level_tapbuf_size5 mux_right_track_8 (
		.in({chany_top_in[4], chany_top_in[8], right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_, right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_7_}),
		.sram(mux_2level_tapbuf_size5_2_sram[0:3]),
		.sram_inv(mux_right_track_8_undriven_sram_inv[0:3]),
		.out(chanx_right_out[4]));

	mux_2level_tapbuf_size5_mem mem_right_track_2 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size3_mem_5_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size5_mem_0_ccff_tail),
		.mem_out(mux_2level_tapbuf_size5_0_sram[0:3]));

	mux_2level_tapbuf_size5_mem mem_right_track_6 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size4_mem_3_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size5_mem_1_ccff_tail),
		.mem_out(mux_2level_tapbuf_size5_1_sram[0:3]));

	mux_2level_tapbuf_size5_mem mem_right_track_8 (
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_2level_tapbuf_size5_mem_1_ccff_tail),
		.ccff_tail(mux_2level_tapbuf_size5_mem_2_ccff_tail),
		.mem_out(mux_2level_tapbuf_size5_2_sram[0:3]));

endmodule
// ----- END Verilog module for sb_0__1_ -----

//----- Default net type -----
`default_nettype wire



