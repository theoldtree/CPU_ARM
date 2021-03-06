module DECODER(
    input   wire      DI,
    input   wire   [3:0]   SEL,
    output   reg      DO0,
    output   reg      DO1,
    output   reg      DO2,
    output   reg      DO3,
    output   reg      DO4,
    output   reg      DO5,
    output   reg      DO6,
    output   reg      DO7,
    output   reg      DO8,
    output   reg      DO9,
    output   reg      DO10,
    output   reg      DO11,
    output   reg      DO12,
    output   reg      DO13,
    output   reg      DO14,
    output   reg      DO15
);

always @ (SEL)
begin
   DO0 <= 0; 
   DO1 <= 0; 
   DO2 <= 0;
   DO3 <= 0;
   DO4 <= 0;
   DO5 <= 0;
   DO6 <= 0;
   DO7 <= 0;
   DO8 <= 0;
   DO9 <= 0;
   DO10 <= 0;
   DO11 <= 0;
   DO12 <= 0;
   DO13 <= 0;
   DO14 <= 0;
   DO15 <= 0;

   casex(SEL)
   4'b0000 : DO0 <= DI;
   4'b0001 : DO1 <= DI;
   4'b0010 : DO2 <= DI;
   4'b0011 : DO3 <= DI;
   4'b0100 : DO4 <= DI;
   4'b0101 : DO5 <= DI;
   4'b0110 : DO6 <= DI;
   4'b0111 : DO7 <= DI;
   4'b1000 : DO8 <= DI;
   4'b1001 : DO9 <= DI;
   4'b1010 : DO10 <= DI;
   4'b1011 : DO11 <= DI;
   4'b1100 : DO12 <= DI;
   4'b1101 : DO13 <= DI;
   4'b1110 : DO14 <= DI;
   4'b1111 : DO15 <= DI;
   endcase

end
endmodule

