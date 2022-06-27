module TB_ALU;
reg [31:0] OP_X;
reg [31:0] OP_Y;
reg [3:0] ALU_CTRL;
wire [3:0] NZCV;
wire [31:0] ALU_OUT;
ALU ALU (
.OP_X (OP_X),
.OP_Y (OP_Y),
.ALU_CTRL (ALU_CTRL),
.NZCV (NZCV),
.ALU_OUT (ALU_OUT)
); // ALU???? ??
initial
begin
OP_X = 32'b11111111000000000000000000000000;
OP_Y = 32'b11110000000000000000000000000000;
// X? Y? ?? ?? ????
ALU_CTRL = 4'b1000;
#2
ALU_CTRL = 4'b0100;
#2
ALU_CTRL = 4'b0010;
#2
ALU_CTRL = 4'b0001;
#2
// ??? ??? ?? +, &, ^, | ?? ??
$finish;
end
endmodule

