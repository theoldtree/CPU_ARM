`timescale 10ns/1ps
module TB_MUX #(parameter BITWIDTH=32);

	reg [BITWIDTH-1:0] DI0;
	reg [BITWIDTH-1:0] DI1;
	reg [BITWIDTH-1:0] DI2;
	reg [BITWIDTH-1:0] DI3;
	reg 			SEL_2;
	reg [3:0]		SEL_4;
	wire [BITWIDTH-1:0]	DO_2;
	wire [BITWIDTH-1:0]	DO_4;

	MUX2to1 MUX2_1(
	.DI0 (DI0),
	.DI1 (DI1),
	.SEL (SEL_2),
	.DO (DO_2)
	);

	MUX4to1 MUX4_1(
	.DI0 (DI0),
	.DI1 (DI1),
	.DI2 (DI2),
	.DI3 (DI3),
	.SEL (SEL_4),
	.DO (DO_4)
	);

	initial
	begin
		DI0 = 32'd0;
		DI1 = 32'd1;
		DI2 = 32'd2;
		DI3 = 32'd3;
		SEL_2 = 1'b0;
	#2
		SEL_2 = 1'b1;
	#2
		SEL_2 = 1'bx;
	#2
		SEL_4 = 4'b0001;
	#2
		SEL_4 = 4'b0010;
	#2
		SEL_4 = 4'b0100;
	#2
		SEL_4 = 4'b1000;
	#6
	$finish();

	end
endmodule
