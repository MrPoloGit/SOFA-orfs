//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Multiplexers
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Aug  3 09:22:00 2026
//-------------------------------------------
//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_size12 -----
module mux_2level_size12(in,
                         sram,
                         sram_inv,
                         out);
//----- INPUT PORTS -----
input [0:11] in;
//----- INPUT PORTS -----
input [0:3] sram;
//----- INPUT PORTS -----
input [0:3] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:3] local_encoder2to4_0_data;
wire [0:3] local_encoder2to4_0_data_inv;
wire [0:3] local_encoder2to4_1_data;
wire [0:3] local_encoder2to4_1_data_inv;
wire [0:0] mux_2level_basis_input4_mem4_0_out;
wire [0:0] mux_2level_basis_input4_mem4_1_out;
wire [0:0] mux_2level_basis_input4_mem4_2_out;
wire [0:0] mux_2level_basis_input4_mem4_3_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_1 sky130_fd_sc_hd__buf_1_0_ (
		.A(mux_2level_basis_input4_mem4_3_out),
		.X(out));

	local_encoder2to4 local_encoder2to4_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to4_0_data[0:3]),
		.data_inv(local_encoder2to4_0_data_inv[0:3]));

	local_encoder2to4 local_encoder2to4_1_ (
		.addr(sram[2:3]),
		.data(local_encoder2to4_1_data[0:3]),
		.data_inv(local_encoder2to4_1_data_inv[0:3]));

	mux_2level_basis_input4_mem4 mux_l1_in_0_ (
		.in(in[0:3]),
		.mem(local_encoder2to4_0_data[0:3]),
		.mem_inv(local_encoder2to4_0_data_inv[0:3]),
		.out(mux_2level_basis_input4_mem4_0_out));

	mux_2level_basis_input4_mem4 mux_l1_in_1_ (
		.in(in[4:7]),
		.mem(local_encoder2to4_0_data[0:3]),
		.mem_inv(local_encoder2to4_0_data_inv[0:3]),
		.out(mux_2level_basis_input4_mem4_1_out));

	mux_2level_basis_input4_mem4 mux_l1_in_2_ (
		.in(in[8:11]),
		.mem(local_encoder2to4_0_data[0:3]),
		.mem_inv(local_encoder2to4_0_data_inv[0:3]),
		.out(mux_2level_basis_input4_mem4_2_out));

	mux_2level_basis_input4_mem4 mux_l2_in_0_ (
		.in({mux_2level_basis_input4_mem4_0_out, mux_2level_basis_input4_mem4_1_out, mux_2level_basis_input4_mem4_2_out, const1_0_const1}),
		.mem(local_encoder2to4_1_data[0:3]),
		.mem_inv(local_encoder2to4_1_data_inv[0:3]),
		.out(mux_2level_basis_input4_mem4_3_out));

endmodule
// ----- END Verilog module for mux_2level_size12 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_size10 -----
module mux_2level_size10(in,
                         sram,
                         sram_inv,
                         out);
//----- INPUT PORTS -----
input [0:9] in;
//----- INPUT PORTS -----
input [0:3] sram;
//----- INPUT PORTS -----
input [0:3] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:3] local_encoder2to4_0_data;
wire [0:3] local_encoder2to4_0_data_inv;
wire [0:3] local_encoder2to4_1_data;
wire [0:3] local_encoder2to4_1_data_inv;
wire [0:0] mux_2level_basis_input2_mem2_0_out;
wire [0:0] mux_2level_basis_input4_mem4_0_out;
wire [0:0] mux_2level_basis_input4_mem4_1_out;
wire [0:0] mux_2level_basis_input4_mem4_2_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_1 sky130_fd_sc_hd__buf_1_0_ (
		.A(mux_2level_basis_input4_mem4_2_out),
		.X(out));

	local_encoder2to4 local_encoder2to4_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to4_0_data[0:3]),
		.data_inv(local_encoder2to4_0_data_inv[0:3]));

	local_encoder2to4 local_encoder2to4_1_ (
		.addr(sram[2:3]),
		.data(local_encoder2to4_1_data[0:3]),
		.data_inv(local_encoder2to4_1_data_inv[0:3]));

	mux_2level_basis_input4_mem4 mux_l1_in_0_ (
		.in(in[0:3]),
		.mem(local_encoder2to4_0_data[0:3]),
		.mem_inv(local_encoder2to4_0_data_inv[0:3]),
		.out(mux_2level_basis_input4_mem4_0_out));

	mux_2level_basis_input4_mem4 mux_l1_in_1_ (
		.in(in[4:7]),
		.mem(local_encoder2to4_0_data[0:3]),
		.mem_inv(local_encoder2to4_0_data_inv[0:3]),
		.out(mux_2level_basis_input4_mem4_1_out));

	mux_2level_basis_input4_mem4 mux_l2_in_0_ (
		.in({mux_2level_basis_input4_mem4_0_out, mux_2level_basis_input4_mem4_1_out, mux_2level_basis_input2_mem2_0_out, const1_0_const1}),
		.mem(local_encoder2to4_1_data[0:3]),
		.mem_inv(local_encoder2to4_1_data_inv[0:3]),
		.out(mux_2level_basis_input4_mem4_2_out));

	mux_2level_basis_input2_mem2 mux_l1_in_2_ (
		.in(in[8:9]),
		.mem(local_encoder2to4_0_data[0:1]),
		.mem_inv(local_encoder2to4_0_data_inv[0:1]),
		.out(mux_2level_basis_input2_mem2_0_out));

endmodule
// ----- END Verilog module for mux_2level_size10 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_tapbuf_size4 -----
module mux_2level_tapbuf_size4(in,
                               sram,
                               sram_inv,
                               out);
//----- INPUT PORTS -----
input [0:3] in;
//----- INPUT PORTS -----
input [0:3] sram;
//----- INPUT PORTS -----
input [0:3] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:2] local_encoder2to3_0_data;
wire [0:2] local_encoder2to3_0_data_inv;
wire [0:2] local_encoder2to3_1_data;
wire [0:2] local_encoder2to3_1_data_inv;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_0_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_1_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_4 sky130_fd_sc_hd__buf_4_0_ (
		.A(mux_2level_tapbuf_basis_input3_mem3_1_out),
		.X(out));

	local_encoder2to3 local_encoder2to3_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to3_0_data[0:2]),
		.data_inv(local_encoder2to3_0_data_inv[0:2]));

	local_encoder2to3 local_encoder2to3_1_ (
		.addr(sram[2:3]),
		.data(local_encoder2to3_1_data[0:2]),
		.data_inv(local_encoder2to3_1_data_inv[0:2]));

	mux_2level_tapbuf_basis_input3_mem3 mux_l1_in_0_ (
		.in(in[0:2]),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_0_out));

	mux_2level_tapbuf_basis_input3_mem3 mux_l2_in_0_ (
		.in({mux_2level_tapbuf_basis_input3_mem3_0_out, in[3], const1_0_const1}),
		.mem(local_encoder2to3_1_data[0:2]),
		.mem_inv(local_encoder2to3_1_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_1_out));

endmodule
// ----- END Verilog module for mux_2level_tapbuf_size4 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_tapbuf_size6 -----
module mux_2level_tapbuf_size6(in,
                               sram,
                               sram_inv,
                               out);
//----- INPUT PORTS -----
input [0:5] in;
//----- INPUT PORTS -----
input [0:3] sram;
//----- INPUT PORTS -----
input [0:3] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:2] local_encoder2to3_0_data;
wire [0:2] local_encoder2to3_0_data_inv;
wire [0:2] local_encoder2to3_1_data;
wire [0:2] local_encoder2to3_1_data_inv;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_0_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_1_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_2_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_4 sky130_fd_sc_hd__buf_4_0_ (
		.A(mux_2level_tapbuf_basis_input3_mem3_2_out),
		.X(out));

	local_encoder2to3 local_encoder2to3_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to3_0_data[0:2]),
		.data_inv(local_encoder2to3_0_data_inv[0:2]));

	local_encoder2to3 local_encoder2to3_1_ (
		.addr(sram[2:3]),
		.data(local_encoder2to3_1_data[0:2]),
		.data_inv(local_encoder2to3_1_data_inv[0:2]));

	mux_2level_tapbuf_basis_input3_mem3 mux_l1_in_0_ (
		.in(in[0:2]),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_0_out));

	mux_2level_tapbuf_basis_input3_mem3 mux_l1_in_1_ (
		.in(in[3:5]),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_1_out));

	mux_2level_tapbuf_basis_input3_mem3 mux_l2_in_0_ (
		.in({mux_2level_tapbuf_basis_input3_mem3_0_out, mux_2level_tapbuf_basis_input3_mem3_1_out, const1_0_const1}),
		.mem(local_encoder2to3_1_data[0:2]),
		.mem_inv(local_encoder2to3_1_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_2_out));

endmodule
// ----- END Verilog module for mux_2level_tapbuf_size6 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_tapbuf_size5 -----
module mux_2level_tapbuf_size5(in,
                               sram,
                               sram_inv,
                               out);
//----- INPUT PORTS -----
input [0:4] in;
//----- INPUT PORTS -----
input [0:3] sram;
//----- INPUT PORTS -----
input [0:3] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:2] local_encoder2to3_0_data;
wire [0:2] local_encoder2to3_0_data_inv;
wire [0:2] local_encoder2to3_1_data;
wire [0:2] local_encoder2to3_1_data_inv;
wire [0:0] mux_2level_tapbuf_basis_input2_mem2_0_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_0_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_1_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_4 sky130_fd_sc_hd__buf_4_0_ (
		.A(mux_2level_tapbuf_basis_input3_mem3_1_out),
		.X(out));

	local_encoder2to3 local_encoder2to3_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to3_0_data[0:2]),
		.data_inv(local_encoder2to3_0_data_inv[0:2]));

	local_encoder2to3 local_encoder2to3_1_ (
		.addr(sram[2:3]),
		.data(local_encoder2to3_1_data[0:2]),
		.data_inv(local_encoder2to3_1_data_inv[0:2]));

	mux_2level_tapbuf_basis_input3_mem3 mux_l1_in_0_ (
		.in(in[0:2]),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_0_out));

	mux_2level_tapbuf_basis_input3_mem3 mux_l2_in_0_ (
		.in({mux_2level_tapbuf_basis_input3_mem3_0_out, mux_2level_tapbuf_basis_input2_mem2_0_out, const1_0_const1}),
		.mem(local_encoder2to3_1_data[0:2]),
		.mem_inv(local_encoder2to3_1_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_1_out));

	mux_2level_tapbuf_basis_input2_mem2 mux_l1_in_1_ (
		.in(in[3:4]),
		.mem(local_encoder2to3_0_data[0:1]),
		.mem_inv(local_encoder2to3_0_data_inv[0:1]),
		.out(mux_2level_tapbuf_basis_input2_mem2_0_out));

endmodule
// ----- END Verilog module for mux_2level_tapbuf_size5 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_tapbuf_size7 -----
module mux_2level_tapbuf_size7(in,
                               sram,
                               sram_inv,
                               out);
//----- INPUT PORTS -----
input [0:6] in;
//----- INPUT PORTS -----
input [0:3] sram;
//----- INPUT PORTS -----
input [0:3] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:2] local_encoder2to3_0_data;
wire [0:2] local_encoder2to3_0_data_inv;
wire [0:2] local_encoder2to3_1_data;
wire [0:2] local_encoder2to3_1_data_inv;
wire [0:0] mux_2level_tapbuf_basis_input2_mem2_0_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_0_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_1_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_2_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_4 sky130_fd_sc_hd__buf_4_0_ (
		.A(mux_2level_tapbuf_basis_input3_mem3_2_out),
		.X(out));

	local_encoder2to3 local_encoder2to3_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to3_0_data[0:2]),
		.data_inv(local_encoder2to3_0_data_inv[0:2]));

	local_encoder2to3 local_encoder2to3_1_ (
		.addr(sram[2:3]),
		.data(local_encoder2to3_1_data[0:2]),
		.data_inv(local_encoder2to3_1_data_inv[0:2]));

	mux_2level_tapbuf_basis_input3_mem3 mux_l1_in_0_ (
		.in(in[0:2]),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_0_out));

	mux_2level_tapbuf_basis_input3_mem3 mux_l1_in_1_ (
		.in(in[3:5]),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_1_out));

	mux_2level_tapbuf_basis_input3_mem3 mux_l2_in_0_ (
		.in({mux_2level_tapbuf_basis_input3_mem3_0_out, mux_2level_tapbuf_basis_input3_mem3_1_out, mux_2level_tapbuf_basis_input2_mem2_0_out}),
		.mem(local_encoder2to3_1_data[0:2]),
		.mem_inv(local_encoder2to3_1_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_2_out));

	mux_2level_tapbuf_basis_input2_mem2 mux_l1_in_2_ (
		.in({in[6], const1_0_const1}),
		.mem(local_encoder2to3_0_data[0:1]),
		.mem_inv(local_encoder2to3_0_data_inv[0:1]),
		.out(mux_2level_tapbuf_basis_input2_mem2_0_out));

endmodule
// ----- END Verilog module for mux_2level_tapbuf_size7 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_tapbuf_size3 -----
module mux_2level_tapbuf_size3(in,
                               sram,
                               sram_inv,
                               out);
//----- INPUT PORTS -----
input [0:2] in;
//----- INPUT PORTS -----
input [0:1] sram;
//----- INPUT PORTS -----
input [0:1] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:0] mux_2level_tapbuf_basis_input2_mem1_0_out;
wire [0:0] mux_2level_tapbuf_basis_input2_mem1_1_out;
wire [0:0] mux_2level_tapbuf_basis_input2_mem1_2_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_4 sky130_fd_sc_hd__buf_4_0_ (
		.A(mux_2level_tapbuf_basis_input2_mem1_2_out),
		.X(out));

	mux_2level_tapbuf_basis_input2_mem1 mux_l1_in_0_ (
		.in(in[0:1]),
		.mem(sram[0]),
		.mem_inv(sram_inv[0]),
		.out(mux_2level_tapbuf_basis_input2_mem1_0_out));

	mux_2level_tapbuf_basis_input2_mem1 mux_l1_in_1_ (
		.in({in[2], const1_0_const1}),
		.mem(sram[0]),
		.mem_inv(sram_inv[0]),
		.out(mux_2level_tapbuf_basis_input2_mem1_1_out));

	mux_2level_tapbuf_basis_input2_mem1 mux_l2_in_0_ (
		.in({mux_2level_tapbuf_basis_input2_mem1_0_out, mux_2level_tapbuf_basis_input2_mem1_1_out}),
		.mem(sram[1]),
		.mem_inv(sram_inv[1]),
		.out(mux_2level_tapbuf_basis_input2_mem1_2_out));

endmodule
// ----- END Verilog module for mux_2level_tapbuf_size3 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_tapbuf_size2 -----
module mux_2level_tapbuf_size2(in,
                               sram,
                               sram_inv,
                               out);
//----- INPUT PORTS -----
input [0:1] in;
//----- INPUT PORTS -----
input [0:1] sram;
//----- INPUT PORTS -----
input [0:1] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:0] mux_2level_tapbuf_basis_input2_mem1_0_out;
wire [0:0] mux_2level_tapbuf_basis_input2_mem1_1_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_4 sky130_fd_sc_hd__buf_4_0_ (
		.A(mux_2level_tapbuf_basis_input2_mem1_1_out),
		.X(out));

	mux_2level_tapbuf_basis_input2_mem1 mux_l1_in_0_ (
		.in(in[0:1]),
		.mem(sram[0]),
		.mem_inv(sram_inv[0]),
		.out(mux_2level_tapbuf_basis_input2_mem1_0_out));

	mux_2level_tapbuf_basis_input2_mem1 mux_l2_in_0_ (
		.in({mux_2level_tapbuf_basis_input2_mem1_0_out, const1_0_const1}),
		.mem(sram[1]),
		.mem_inv(sram_inv[1]),
		.out(mux_2level_tapbuf_basis_input2_mem1_1_out));

endmodule
// ----- END Verilog module for mux_2level_tapbuf_size2 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_tapbuf_size8 -----
module mux_2level_tapbuf_size8(in,
                               sram,
                               sram_inv,
                               out);
//----- INPUT PORTS -----
input [0:7] in;
//----- INPUT PORTS -----
input [0:3] sram;
//----- INPUT PORTS -----
input [0:3] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:2] local_encoder2to3_0_data;
wire [0:2] local_encoder2to3_0_data_inv;
wire [0:2] local_encoder2to3_1_data;
wire [0:2] local_encoder2to3_1_data_inv;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_0_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_1_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_2_out;
wire [0:0] mux_2level_tapbuf_basis_input3_mem3_3_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_4 sky130_fd_sc_hd__buf_4_0_ (
		.A(mux_2level_tapbuf_basis_input3_mem3_3_out),
		.X(out));

	local_encoder2to3 local_encoder2to3_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to3_0_data[0:2]),
		.data_inv(local_encoder2to3_0_data_inv[0:2]));

	local_encoder2to3 local_encoder2to3_1_ (
		.addr(sram[2:3]),
		.data(local_encoder2to3_1_data[0:2]),
		.data_inv(local_encoder2to3_1_data_inv[0:2]));

	mux_2level_tapbuf_basis_input3_mem3 mux_l1_in_0_ (
		.in(in[0:2]),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_0_out));

	mux_2level_tapbuf_basis_input3_mem3 mux_l1_in_1_ (
		.in(in[3:5]),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_1_out));

	mux_2level_tapbuf_basis_input3_mem3 mux_l1_in_2_ (
		.in({in[6:7], const1_0_const1}),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_2_out));

	mux_2level_tapbuf_basis_input3_mem3 mux_l2_in_0_ (
		.in({mux_2level_tapbuf_basis_input3_mem3_0_out, mux_2level_tapbuf_basis_input3_mem3_1_out, mux_2level_tapbuf_basis_input3_mem3_2_out}),
		.mem(local_encoder2to3_1_data[0:2]),
		.mem_inv(local_encoder2to3_1_data_inv[0:2]),
		.out(mux_2level_tapbuf_basis_input3_mem3_3_out));

endmodule
// ----- END Verilog module for mux_2level_tapbuf_size8 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_tapbuf_size9 -----
module mux_2level_tapbuf_size9(in,
                               sram,
                               sram_inv,
                               out);
//----- INPUT PORTS -----
input [0:8] in;
//----- INPUT PORTS -----
input [0:3] sram;
//----- INPUT PORTS -----
input [0:3] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:3] local_encoder2to4_0_data;
wire [0:3] local_encoder2to4_0_data_inv;
wire [0:3] local_encoder2to4_1_data;
wire [0:3] local_encoder2to4_1_data_inv;
wire [0:0] mux_2level_tapbuf_basis_input4_mem4_0_out;
wire [0:0] mux_2level_tapbuf_basis_input4_mem4_1_out;
wire [0:0] mux_2level_tapbuf_basis_input4_mem4_2_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_4 sky130_fd_sc_hd__buf_4_0_ (
		.A(mux_2level_tapbuf_basis_input4_mem4_2_out),
		.X(out));

	local_encoder2to4 local_encoder2to4_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to4_0_data[0:3]),
		.data_inv(local_encoder2to4_0_data_inv[0:3]));

	local_encoder2to4 local_encoder2to4_1_ (
		.addr(sram[2:3]),
		.data(local_encoder2to4_1_data[0:3]),
		.data_inv(local_encoder2to4_1_data_inv[0:3]));

	mux_2level_tapbuf_basis_input4_mem4 mux_l1_in_0_ (
		.in(in[0:3]),
		.mem(local_encoder2to4_0_data[0:3]),
		.mem_inv(local_encoder2to4_0_data_inv[0:3]),
		.out(mux_2level_tapbuf_basis_input4_mem4_0_out));

	mux_2level_tapbuf_basis_input4_mem4 mux_l1_in_1_ (
		.in(in[4:7]),
		.mem(local_encoder2to4_0_data[0:3]),
		.mem_inv(local_encoder2to4_0_data_inv[0:3]),
		.out(mux_2level_tapbuf_basis_input4_mem4_1_out));

	mux_2level_tapbuf_basis_input4_mem4 mux_l2_in_0_ (
		.in({mux_2level_tapbuf_basis_input4_mem4_0_out, mux_2level_tapbuf_basis_input4_mem4_1_out, in[8], const1_0_const1}),
		.mem(local_encoder2to4_1_data[0:3]),
		.mem_inv(local_encoder2to4_1_data_inv[0:3]),
		.out(mux_2level_tapbuf_basis_input4_mem4_2_out));

endmodule
// ----- END Verilog module for mux_2level_tapbuf_size9 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_2level_tapbuf_size10 -----
module mux_2level_tapbuf_size10(in,
                                sram,
                                sram_inv,
                                out);
//----- INPUT PORTS -----
input [0:9] in;
//----- INPUT PORTS -----
input [0:3] sram;
//----- INPUT PORTS -----
input [0:3] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:3] local_encoder2to4_0_data;
wire [0:3] local_encoder2to4_0_data_inv;
wire [0:3] local_encoder2to4_1_data;
wire [0:3] local_encoder2to4_1_data_inv;
wire [0:0] mux_2level_tapbuf_basis_input2_mem2_0_out;
wire [0:0] mux_2level_tapbuf_basis_input4_mem4_0_out;
wire [0:0] mux_2level_tapbuf_basis_input4_mem4_1_out;
wire [0:0] mux_2level_tapbuf_basis_input4_mem4_2_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__buf_4 sky130_fd_sc_hd__buf_4_0_ (
		.A(mux_2level_tapbuf_basis_input4_mem4_2_out),
		.X(out));

	local_encoder2to4 local_encoder2to4_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to4_0_data[0:3]),
		.data_inv(local_encoder2to4_0_data_inv[0:3]));

	local_encoder2to4 local_encoder2to4_1_ (
		.addr(sram[2:3]),
		.data(local_encoder2to4_1_data[0:3]),
		.data_inv(local_encoder2to4_1_data_inv[0:3]));

	mux_2level_tapbuf_basis_input4_mem4 mux_l1_in_0_ (
		.in(in[0:3]),
		.mem(local_encoder2to4_0_data[0:3]),
		.mem_inv(local_encoder2to4_0_data_inv[0:3]),
		.out(mux_2level_tapbuf_basis_input4_mem4_0_out));

	mux_2level_tapbuf_basis_input4_mem4 mux_l1_in_1_ (
		.in(in[4:7]),
		.mem(local_encoder2to4_0_data[0:3]),
		.mem_inv(local_encoder2to4_0_data_inv[0:3]),
		.out(mux_2level_tapbuf_basis_input4_mem4_1_out));

	mux_2level_tapbuf_basis_input4_mem4 mux_l2_in_0_ (
		.in({mux_2level_tapbuf_basis_input4_mem4_0_out, mux_2level_tapbuf_basis_input4_mem4_1_out, mux_2level_tapbuf_basis_input2_mem2_0_out, const1_0_const1}),
		.mem(local_encoder2to4_1_data[0:3]),
		.mem_inv(local_encoder2to4_1_data_inv[0:3]),
		.out(mux_2level_tapbuf_basis_input4_mem4_2_out));

	mux_2level_tapbuf_basis_input2_mem2 mux_l1_in_2_ (
		.in(in[8:9]),
		.mem(local_encoder2to4_0_data[0:1]),
		.mem_inv(local_encoder2to4_0_data_inv[0:1]),
		.out(mux_2level_tapbuf_basis_input2_mem2_0_out));

endmodule
// ----- END Verilog module for mux_2level_tapbuf_size10 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_1level_tapbuf_size2 -----
module mux_1level_tapbuf_size2(in,
                               sram,
                               sram_inv,
                               out);
//----- INPUT PORTS -----
input [0:1] in;
//----- INPUT PORTS -----
input [0:1] sram;
//----- INPUT PORTS -----
input [0:1] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:2] local_encoder2to3_0_data;
wire [0:2] local_encoder2to3_0_data_inv;
wire [0:0] mux_1level_tapbuf_basis_input3_mem3_0_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__inv_4 sky130_fd_sc_hd__inv_4_0_ (
		.A(mux_1level_tapbuf_basis_input3_mem3_0_out),
		.Y(out));

	local_encoder2to3 local_encoder2to3_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to3_0_data[0:2]),
		.data_inv(local_encoder2to3_0_data_inv[0:2]));

	mux_1level_tapbuf_basis_input3_mem3 mux_l1_in_0_ (
		.in({in[0:1], const1_0_const1}),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_1level_tapbuf_basis_input3_mem3_0_out));

endmodule
// ----- END Verilog module for mux_1level_tapbuf_size2 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for mux_1level_size2 -----
module mux_1level_size2(in,
                        sram,
                        sram_inv,
                        out);
//----- INPUT PORTS -----
input [0:1] in;
//----- INPUT PORTS -----
input [0:1] sram;
//----- INPUT PORTS -----
input [0:1] sram_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] const1_0_const1;
wire [0:2] local_encoder2to3_0_data;
wire [0:2] local_encoder2to3_0_data_inv;
wire [0:0] mux_1level_basis_input3_mem3_0_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	const1 const1_0_ (
		.const1(const1_0_const1));

	sky130_fd_sc_hd__inv_1 sky130_fd_sc_hd__inv_1_0_ (
		.A(mux_1level_basis_input3_mem3_0_out),
		.Y(out));

	local_encoder2to3 local_encoder2to3_0_ (
		.addr(sram[0:1]),
		.data(local_encoder2to3_0_data[0:2]),
		.data_inv(local_encoder2to3_0_data_inv[0:2]));

	mux_1level_basis_input3_mem3 mux_l1_in_0_ (
		.in({in[0:1], const1_0_const1}),
		.mem(local_encoder2to3_0_data[0:2]),
		.mem_inv(local_encoder2to3_0_data_inv[0:2]),
		.out(mux_1level_basis_input3_mem3_0_out));

endmodule
// ----- END Verilog module for mux_1level_size2 -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype none

// ----- Verilog module for frac_lut4_mux -----
module frac_lut4_mux(in,
                     sram,
                     sram_inv,
                     lut2_out,
                     lut3_out,
                     lut4_out);
//----- INPUT PORTS -----
input [0:15] in;
//----- INPUT PORTS -----
input [0:3] sram;
//----- INPUT PORTS -----
input [0:3] sram_inv;
//----- OUTPUT PORTS -----
output [0:1] lut2_out;
//----- OUTPUT PORTS -----
output [0:1] lut3_out;
//----- OUTPUT PORTS -----
output [0:0] lut4_out;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sky130_fd_sc_hd__buf_2_5_X;
wire [0:0] sky130_fd_sc_hd__buf_2_6_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_0_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_10_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_11_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_12_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_13_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_14_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_8_X;
wire [0:0] sky130_fd_sc_hd__mux2_1_9_X;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sky130_fd_sc_hd__buf_2 sky130_fd_sc_hd__buf_2_0_ (
		.A(sky130_fd_sc_hd__mux2_1_10_X),
		.X(lut2_out[0]));

	sky130_fd_sc_hd__buf_2 sky130_fd_sc_hd__buf_2_1_ (
		.A(sky130_fd_sc_hd__mux2_1_11_X),
		.X(lut2_out[1]));

	sky130_fd_sc_hd__buf_2 sky130_fd_sc_hd__buf_2_2_ (
		.A(sky130_fd_sc_hd__mux2_1_12_X),
		.X(lut3_out[0]));

	sky130_fd_sc_hd__buf_2 sky130_fd_sc_hd__buf_2_3_ (
		.A(sky130_fd_sc_hd__mux2_1_13_X),
		.X(lut3_out[1]));

	sky130_fd_sc_hd__buf_2 sky130_fd_sc_hd__buf_2_4_ (
		.A(sky130_fd_sc_hd__mux2_1_14_X),
		.X(lut4_out));

	sky130_fd_sc_hd__buf_2 sky130_fd_sc_hd__buf_2_5_ (
		.A(sky130_fd_sc_hd__mux2_1_8_X),
		.X(sky130_fd_sc_hd__buf_2_5_X));

	sky130_fd_sc_hd__buf_2 sky130_fd_sc_hd__buf_2_6_ (
		.A(sky130_fd_sc_hd__mux2_1_9_X),
		.X(sky130_fd_sc_hd__buf_2_6_X));

	sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ (
		.A1(in[0]),
		.A0(in[1]),
		.S(sram[0]),
		.X(sky130_fd_sc_hd__mux2_1_0_X));

	sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ (
		.A1(in[2]),
		.A0(in[3]),
		.S(sram[0]),
		.X(sky130_fd_sc_hd__mux2_1_1_X));

	sky130_fd_sc_hd__mux2_1 mux_l1_in_2_ (
		.A1(in[4]),
		.A0(in[5]),
		.S(sram[0]),
		.X(sky130_fd_sc_hd__mux2_1_2_X));

	sky130_fd_sc_hd__mux2_1 mux_l1_in_3_ (
		.A1(in[6]),
		.A0(in[7]),
		.S(sram[0]),
		.X(sky130_fd_sc_hd__mux2_1_3_X));

	sky130_fd_sc_hd__mux2_1 mux_l1_in_4_ (
		.A1(in[8]),
		.A0(in[9]),
		.S(sram[0]),
		.X(sky130_fd_sc_hd__mux2_1_4_X));

	sky130_fd_sc_hd__mux2_1 mux_l1_in_5_ (
		.A1(in[10]),
		.A0(in[11]),
		.S(sram[0]),
		.X(sky130_fd_sc_hd__mux2_1_5_X));

	sky130_fd_sc_hd__mux2_1 mux_l1_in_6_ (
		.A1(in[12]),
		.A0(in[13]),
		.S(sram[0]),
		.X(sky130_fd_sc_hd__mux2_1_6_X));

	sky130_fd_sc_hd__mux2_1 mux_l1_in_7_ (
		.A1(in[14]),
		.A0(in[15]),
		.S(sram[0]),
		.X(sky130_fd_sc_hd__mux2_1_7_X));

	sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ (
		.A1(sky130_fd_sc_hd__mux2_1_0_X),
		.A0(sky130_fd_sc_hd__mux2_1_1_X),
		.S(sram[1]),
		.X(sky130_fd_sc_hd__mux2_1_8_X));

	sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ (
		.A1(sky130_fd_sc_hd__mux2_1_2_X),
		.A0(sky130_fd_sc_hd__mux2_1_3_X),
		.S(sram[1]),
		.X(sky130_fd_sc_hd__mux2_1_9_X));

	sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ (
		.A1(sky130_fd_sc_hd__mux2_1_4_X),
		.A0(sky130_fd_sc_hd__mux2_1_5_X),
		.S(sram[1]),
		.X(sky130_fd_sc_hd__mux2_1_10_X));

	sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ (
		.A1(sky130_fd_sc_hd__mux2_1_6_X),
		.A0(sky130_fd_sc_hd__mux2_1_7_X),
		.S(sram[1]),
		.X(sky130_fd_sc_hd__mux2_1_11_X));

	sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ (
		.A1(sky130_fd_sc_hd__buf_2_5_X),
		.A0(sky130_fd_sc_hd__buf_2_6_X),
		.S(sram[2]),
		.X(sky130_fd_sc_hd__mux2_1_12_X));

	sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ (
		.A1(sky130_fd_sc_hd__mux2_1_10_X),
		.A0(sky130_fd_sc_hd__mux2_1_11_X),
		.S(sram[2]),
		.X(sky130_fd_sc_hd__mux2_1_13_X));

	sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ (
		.A1(sky130_fd_sc_hd__mux2_1_12_X),
		.A0(sky130_fd_sc_hd__mux2_1_13_X),
		.S(sram[3]),
		.X(sky130_fd_sc_hd__mux2_1_14_X));

endmodule
// ----- END Verilog module for frac_lut4_mux -----

//----- Default net type -----
`default_nettype wire




