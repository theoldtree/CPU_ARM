`timescale 10ns/1ps
module TB_IMMEXTENSION;

	reg	[2:0]	IMM3;
	reg	[4:0]	IMM5;
	reg	[7:0]	IMM8;
	reg	[11:0]	IMM11;
	wire	[31:0]	IMM3_EX;
	wire	[31:0]	IMM5_EX;
	wire	[31:0]	IMM8_EX;
	wire	[31:0]	IMM11_EX;

	IMMEXTENSION immext(
	.IMM3	(IMM3),
	.IMM5	(IMM5),
	.IMM8	(IMM8),
	.IMM11	(IMM11),
	.IMM3_EX	(IMM3_EX),
	.IMM5_EX	(IMM5_EX),
	.IMM8_EX	(IMM8_EX),
	.IMM11_EX	(IMM11_EX)
	);

	initial
	begin
	#2
		IMM3 = 3'b111;
	#2
		IMM5 = 5'b11111;
	#2
		IMM8 = 8'b11111111;
	#2
		IMM11 = 11'b11111111111;
	end
endmodule
