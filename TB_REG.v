`timescale 10ns/1ps
module TB_REG;
	reg	CLK;
	reg	RST;
	reg	EN;
	reg	[31:0]	D;
	reg	[31:0]	Q;

	initial CLK = 1?b0;
	always #1 CLK = ~ CLK;

	REG 	#(32) 	REG(
		.CLK	(CLK),
		.RST	(RST),
		.EN	(EN),
		.D	(D),
		.Q	(Q)
	);

	initial
	begin
			RST = 1?b0;
	#2
			EN = 1?b0;
			RST = 1?b0;
			D = 32?d100;
	#2
			EN = 1?b1;
			D = 32?d100;
	#2
			D = 32d?1234;
	#2
			RST = 1?b1;
	#2
			$finish;
	end
endmodule
