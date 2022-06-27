module CLK_GEN(
	input	wire	ICLK,
	input	wire	RST,
	output	wire	OCLK
);
	reg q;
	
	always@(posedge RST)	q <= 1'b0;
	always@(posedge ICLK)	q <= ~q;
	
	assign OCLK = q;
	
endmodule
	
