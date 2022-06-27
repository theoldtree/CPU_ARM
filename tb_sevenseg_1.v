`timescale 1ns/10ps
module tb_sevenseg;

reg [3:0] X,Y;
wire [6:0] HEX1,HEX0;

sevevenseg SV(HEX1,HEX0,X,Y);

initial
begin
  X = 4'b0000; Y = 4'b1001;
  #5 X = 4'b0001; Y = 4'b1000;
  #5 X = 4'b0010; Y = 4'b0111;
  #5 X = 4'b0011; Y = 4'b0110;
  #5 X = 4'b0100; Y = 4'b0101;
  #5 X = 4'b0101; Y = 4'b0100;
  #5 X = 4'b0110; Y = 4'b0011;
  #5 X = 4'b0111; Y = 4'b0010;
  #5 X = 4'b1000; Y = 4'b0001;
  #5 X = 4'b1001; Y = 4'b0000;
  #5 X = 4'b0000; Y = 4'b0000;
end

endmodule

