
`timescale 10ns/1ps
module TB_NZCV_CHECK;

	reg	[3:0]	NZCV;
	reg	[3:0]	COND;
	wire		OUT;

	NZCV_CHECK	nzcv_check
	(
		.NZCV	(NZCV),
		.COND	(COND),
		.OUT	(OUT)
	); // NZCV_CHECK ???? ??

	initial
	begin
		COND = 4'b0000;
		NZCV = 4'b0100; // ???
	// ??? ??? ?? ? ??? ?? COND ?? NZCV?? ???? ??? ??? ???
	#1
		NZCV = 4'b1011;
	#1
		COND = 4'b0001;
	#1
		NZCV = 4'b0100;
	#1
		COND = 4'b0010;
		NZCV = 4'b0010;
	#1
		NZCV = 4'b1101;
	#1
		COND = 4'b0011;
	#1
		NZCV = 4'b0010;
	#1
		COND = 4'b0100;
		NZCV = 4'b1000;
	#1
		NZCV = 4'b0111;
	#1
		COND = 4'b0101;
	#1
		NZCV = 4'b1000;
	#1
		COND = 4'b0110;
		NZCV = 4'b0001;
	#1
		NZCV = 4'b1000;
	#1
		COND = 4'b0111;
		NZCV = 4'b1110;
	#1
		NZCV = 4'b0001;
	#1
		COND = 4'b1000;
		NZCV = 4'b1011;
	#1
		NZCV = 4'b0100;
	#1
		COND = 4'b1001;
		NZCV = 4'b0101;
	#1
		NZCV = 4'b0010;
	#1
		COND = 4'b1010;
		NZCV = 4'b1001;
	#1
		NZCV = 4'b1000;
	#1
		COND = 4'b1011;
	#1
		NZCV = 4'b1001;
	#1
		COND = 4'b1100;
		NZCV = 4'b0000;
	#1
		NZCV = 4'b1010;
	#1
		COND = 4'b1101;
		NZCV = 4'b1101;
	#1
		NZCV = 4'b0000;
	#1
		COND = 4'b1110;
		NZCV = 4'b1100;
	#1
		NZCV = 4'b0111;
	#1
	$finish();
	end

endmodule  