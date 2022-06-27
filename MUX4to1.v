module MUX4to1 #(parameter BITWIDTH = 32)(	//BITWIDTH? 32? ??
   input wire [BITWIDTH-1:0] DI0,
   input wire [BITWIDTH-1:0] DI1,
   input wire [BITWIDTH-1:0] DI2,
   input wire [BITWIDTH-1:0] DI3,
   input wire [3:0] SEL,
   output wire [BITWIDTH-1:0] DO
); // ???? DI0, DI1, DI2, DI3? ???? SEL, ?? DO?? ??
assign DO=({BITWIDTH{SEL[0]}}&DI0)|({BITWIDTH{SEL[1]}}&DI1)|({BITWIDTH{SEL[2]}}&DI2)|({BITWIDTH{SEL[3]}}&DI3); // ????? ???? ???? ? 4??? ??? DO ??
endmodule
