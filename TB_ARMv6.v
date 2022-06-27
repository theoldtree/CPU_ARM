module TB_ARMv6;
reg CLK;
reg RST;
// ARMv6(TOP MODULE)
ARMv6 ARMv6(
.CLK (CLK),
.RST (RST)
);
// CLOCK
initial CLK = 1'b0;
always #1 CLK = ~CLK;
initial
begin
RST = 1'b1;
#4
RST = 1'b0;
#400
$finish();
end
endmodule
