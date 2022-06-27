module NZCV_CHECK(
	input	wire[3:0]	NZCV,
	input	wire[3:0]	COND,
	output	reg		OUT
); // 4??? ???? NZCV(flag), COND(????)? ???? ???? OUT??

always @(*)
begin
	casex(COND)
		4'b0000:	OUT <= NZCV[2];
		4'b0001:	OUT <= ~NZCV[2];
		4'b0010:	OUT <= NZCV[1];
		4'b0011:	OUT <= ~NZCV[1];
		4'b0100:	OUT <= NZCV[3];
		4'b0101:	OUT <= ~NZCV[3];
		4'b0110:	OUT <= NZCV[0];
		4'b0111:	OUT <= ~NZCV[0];
		4'b1000:	OUT <= NZCV[1]&~NZCV[2];
		4'b1001:	OUT <= ~NZCV[1]|NZCV[2];
		4'b1010:	OUT <= NZCV[3]==NZCV[0];
		4'b1011:	OUT <= NZCV[3]!=NZCV[0];
		4'b1100:	OUT <= (~NZCV[2]&(NZCV[3]==NZCV[0]));
		4'b1101:	OUT <= (NZCV[2]|(NZCV[3]!=NZCV[0]));
		4'b1110:	OUT <= 1'b1;
// ? ????? ?? ?? ?? ?? ???
	endcase
end

endmodule
