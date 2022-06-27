module REGMUX   #(parameter BITWIDTH = 32) (
   input   wire   [3:0]      ADDR,
   input   wire   [BITWIDTH-1:0]   IN0,
   input   wire   [BITWIDTH-1:0]   IN1,
   input   wire   [BITWIDTH-1:0]   IN2,
   input   wire   [BITWIDTH-1:0]   IN3,
   input   wire   [BITWIDTH-1:0]   IN4,
   input   wire   [BITWIDTH-1:0]   IN5,
   input   wire   [BITWIDTH-1:0]   IN6,
   input   wire   [BITWIDTH-1:0]   IN7,
   input   wire   [BITWIDTH-1:0]   IN8,
   input   wire   [BITWIDTH-1:0]   IN9,
   input   wire   [BITWIDTH-1:0]   IN10,
   input   wire   [BITWIDTH-1:0]   IN11,
   input   wire   [BITWIDTH-1:0]   IN12,
   input   wire   [BITWIDTH-1:0]   IN13,
   input   wire   [BITWIDTH-1:0]   IN14,
   input   wire   [BITWIDTH-1:0]   IN15,

   output   reg   [BITWIDTH-1:0]   OUT
);
   always @ (*)
   casex(ADDR)
      4'b0000 : OUT <= IN0;
      4'b0001 : OUT <= IN1;
      4'b0010 : OUT <= IN2;
      4'b0011 : OUT <= IN3;
      4'b0100 : OUT <= IN4;
      4'b0101 : OUT <= IN5;
      4'b0110 : OUT <= IN6;
      4'b0111 : OUT <= IN7;
      4'b1000 : OUT <= IN8;
      4'b1001 : OUT <= IN9;
      4'b1010 : OUT <= IN10;
      4'b1011 : OUT <= IN11;
      4'b1100 : OUT <= IN12;
      4'b1101 : OUT <= IN13;
      4'b1110 : OUT <= IN14;
      4'b1111 : OUT <= IN15;
   endcase
endmodule
