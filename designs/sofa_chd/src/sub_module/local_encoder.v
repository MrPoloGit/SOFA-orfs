//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Local Decoders for Multiplexers
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Aug  3 09:22:00 2026
//-------------------------------------------
//----- Default net type -----
`default_nettype none

// ----- Verilog module for local_encoder2to4 -----
module local_encoder2to4(addr,
                         data,
                         data_inv);
//----- INPUT PORTS -----
input [0:1] addr;
//----- OUTPUT PORTS -----
output [0:3] data;
//----- OUTPUT PORTS -----
output [0:3] data_inv;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
reg [0:3] data;
//----- END Registered ports -----

// ----- BEGIN Verilog codes for Decoder convert 2-bit addr to 4-bit data -----
	always@(addr[0:1])
	case (addr[0:1])
		{2{1'b0}} : data[0:3] = 4'b1000;
		2'b10 : data[0:3] = 4'b0100;
		2'b01 : data[0:3] = 4'b0010;
		{2{1'b1}} : data[0:3] = 4'b0001;
		default : data[0:3] = 4'b0001;
	endcase
	assign data_inv[0:3] = ~data[0:3];
// ----- END Verilog codes for Decoder convert 2-bit addr to 4-bit data -----
endmodule
// ----- END Verilog module for local_encoder2to4 -----

//----- Default net type -----
`default_nettype wire

//----- Default net type -----
`default_nettype none

// ----- Verilog module for local_encoder1to2 -----
module local_encoder1to2(addr,
                         data,
                         data_inv);
//----- INPUT PORTS -----
input [0:0] addr;
//----- OUTPUT PORTS -----
output [0:1] data;
//----- OUTPUT PORTS -----
output [0:1] data_inv;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
reg [0:1] data;
//----- END Registered ports -----

// ----- BEGIN Verilog codes for Decoder convert 1-bit addr to 2-bit data -----
	always@(addr[0])
	case (addr[0])
		1'b0 : data[0:1] = 2'b10;
		1'b1 : data[0:1] = 2'b01;
		default : data[0:1] = 2'b01;
	endcase
	assign data_inv[0:1] = ~data[0:1];
// ----- END Verilog codes for Decoder convert 1-bit addr to 2-bit data -----
endmodule
// ----- END Verilog module for local_encoder1to2 -----

//----- Default net type -----
`default_nettype wire

//----- Default net type -----
`default_nettype none

// ----- Verilog module for local_encoder2to3 -----
module local_encoder2to3(addr,
                         data,
                         data_inv);
//----- INPUT PORTS -----
input [0:1] addr;
//----- OUTPUT PORTS -----
output [0:2] data;
//----- OUTPUT PORTS -----
output [0:2] data_inv;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
reg [0:2] data;
//----- END Registered ports -----

// ----- BEGIN Verilog codes for Decoder convert 2-bit addr to 3-bit data -----
	always@(addr[0:1])
	case (addr[0:1])
		{2{1'b0}} : data[0:2] = 3'b100;
		2'b10 : data[0:2] = 3'b010;
		2'b01 : data[0:2] = 3'b001;
		default : data[0:2] = 3'b001;
	endcase
	assign data_inv[0:2] = ~data[0:2];
// ----- END Verilog codes for Decoder convert 2-bit addr to 3-bit data -----
endmodule
// ----- END Verilog module for local_encoder2to3 -----

//----- Default net type -----
`default_nettype wire

//----- Default net type -----
`default_nettype none

// ----- Verilog module for local_encoder1to1 -----
module local_encoder1to1(addr,
                         data,
                         data_inv);
//----- INPUT PORTS -----
input [0:0] addr;
//----- OUTPUT PORTS -----
output [0:0] data;
//----- OUTPUT PORTS -----
output [0:0] data_inv;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----

// ----- BEGIN Verilog codes for Decoder convert 1-bit addr to 1-bit data -----
	assign data[0] = addr[0];
	assign data_inv[0] = ~addr[0];
// ----- END Verilog codes for Decoder convert 1-bit addr to 1-bit data -----
endmodule
// ----- END Verilog module for local_encoder1to1 -----

//----- Default net type -----
`default_nettype wire

