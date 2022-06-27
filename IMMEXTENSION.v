module IMMEXTENSION(
   input wire [2:0] IMM3,
   input wire [4:0] IMM5,
   input wire [7:0] IMM8,
   input wire [10:0] IMM11,
   output wire [31:0] IMM3_EX,
   output wire [31:0] IMM5_EX,
   output wire [31:0] IMM8_EX,
   output wire [31:0] IMM11_EX
); // ???? IMM3,IMM5,IMM8,IMM11 ???? IMM3_EX,IMM5_EX,IMM8_EX,IMM11_EX ??
   assign IMM3_EX = {29'd0, IMM3};
   assign IMM5_EX = {25'd0, IMM5,2'd0};
   assign IMM8_EX = {{23{IMM8[7]}}, IMM8, 1'b0};
   assign IMM11_EX = {{20{IMM11[10]}}, IMM11, 1'b0};
//IMM3_EX,IMM5_EX,IMM8_EX,IMM11_EX? ?? ??? ??? ?? ??.
endmodule

