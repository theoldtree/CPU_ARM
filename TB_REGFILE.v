`timescale 10ns/1ps
module TB_REGFILE;
	reg [3:0] RADDR1_R;
	reg [3:0] RADDR2_R;
	reg [3:0] RADDR3_W;
	reg [31:0] WDATA;
	wire [31:0] RDATA1;
	wire [31:0] RDATA2;
	reg W_EN;
	reg CLK;
	reg RST;

	initial CLK = 1'b0;
	always #1 CLK = ~CLK;

	REGFILE REGFILE
	(
	.CLK (CLK),
	.RST (RST),
	.W_EN (W_EN),
	.RADDR1_R (RADDR1_R),
	.RADDR2_R (RADDR2_R),
	.RADDR3_W (RADDR3_W),
	.WDATA (WDATA),
	.RDATA1 (RDATA1),
	.RDATA2 (RDATA2)
	);

	initial
	begin
		W_EN = 1'b1;
		RST = 1'b1;
	#2
		RST = 1'b0;
	#2
		WDATA = 32'd1;
		RADDR3_W = 4'b0000;
	#2
		WDATA = 32'd2;
		RADDR3_W = 4'b0001;
	#2
		WDATA = 32'd3;
		RADDR3_W = 4'b0010;
	#2
		WDATA = 32'd4;
		RADDR3_W = 4'b0011;
	#2
		WDATA = 32'd5;
		RADDR3_W = 4'b0100;
	#2
		WDATA = 32'd6;
		RADDR3_W = 4'b0101;
	#2
		WDATA = 32'd7;
		RADDR3_W = 4'b0110;
	#2
		WDATA = 32'd8;
		RADDR3_W = 4'b0111;
	#2
		WDATA = 32'd9;
		RADDR3_W = 4'b1000;
	#2
		WDATA = 32'd10;
		RADDR3_W = 4'b1001;
	#2
		WDATA = 32'd11;
		RADDR3_W = 4'b1010;
	#2
		WDATA = 32'd12;
		RADDR3_W = 4'b1011;
	#2
		WDATA = 32'd13;
		RADDR3_W = 4'b1100;
	#2
		WDATA = 32'd14;
		RADDR3_W = 4'b1101;
	#2
		WDATA = 32'd15;
		RADDR3_W = 4'b1110;
	#2
		WDATA = 32'd16;
		RADDR3_W = 4'b1111;
	#2
		RADDR1_R = 4'b0001;
		RADDR2_R = 4'b0101;
	#2
		RADDR1_R = 4'b1001;
		RADDR2_R = 4'b1111;
	$finish;
	end
endmodule
