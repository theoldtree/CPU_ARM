module ADDER #(parameter BITWIDTH = 32) (
	input wire [BITWIDTH-1:0] A,
	input wire [BITWIDTH-1:0] B,
	input wire C_IN,
	output wire [BITWIDTH-1:0] SUM,
	output wire C_OUT
	
);
assign {C_OUT,SUM} = A + B + C_IN;
endmodule

