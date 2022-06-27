`timescale 10ns/1ps
module TB_SRAM;
reg CLK;
reg [9:0] ADDR;
reg WEN;
reg [31:0] DI;
wire [31:0] DO;
initial CLK = 1'b0;
always #1 CLK = ~CLK;
SRAM SRAM(
.CLK (CLK),
.ADDR (ADDR),
.WEN (WEN),
.DI (DI),
.DO (DO)
);
initial
begin
WEN = 1'b1;
ADDR = 10'd0;
DI = 32'd1;
#2
ADDR = 10'd4;
DI = 32'd2;
#2
WEN = 1'b0;
ADDR = 10'd0;
DI = 32'd10;
#2
ADDR = 10'd4;
#2
$finish;
end
endmodule
