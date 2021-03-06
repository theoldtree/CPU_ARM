module REGFILE (
	input wire CLK,
	input wire RST,
	input wire W_EN,
	input wire [3:0] RADDR1_R,
	input wire [3:0] RADDR2_R,
	input wire [3:0] RADDR3_W,
	input wire [31:0] WDATA,
	output wire [31:0] RDATA1,
	output wire [31:0] RDATA2
); // ????? ??(CLK), ??(RST), write enable(W_EN), ???? ??(RADDR1_R, RADDR2_R, RADDR3_R), ???(WDATA), ????? RDATA1, RDATA2 ??
	wire en0;
	wire en1;
	wire en2;
	wire en3;
	wire en4;
	wire en5;
	wire en6;
	wire en7;
	wire en8;
	wire en9;
	wire en10;
	wire en11;
	wire en12;
	wire en13;
	wire en14;
	wire en15; // ??? ????? enable ? ? ?? ?? en0~15 ??
	wire [31:0] q0;
	wire [31:0] q1;
	wire [31:0] q2;
	wire [31:0] q3;
	wire [31:0] q4;
	wire [31:0] q5;
	wire [31:0] q6;
	wire [31:0] q7;
	wire [31:0] q8;
	wire [31:0] q9;
	wire [31:0] q10;
	wire [31:0] q11;
	wire [31:0] q12;
	wire [31:0] q13;
	wire [31:0] q14;
	wire [31:0] q15; // enable ??? ?? ??? ?????? ???? ??
REG #(32) R0 (
	.CLK (CLK),
	.RST (RST),
	.EN (en0),
	.D (WDATA),
	.Q (q0)
); // ???? ???? ??, ?? R1~R15?? ?? ??
REG #(32) R1 (
	.CLK (CLK),
	.RST (RST),
	.EN (en1),
	.D (WDATA),
	.Q (q1)
); 
REG #(32) R2 (
	.CLK (CLK),
	.RST (RST),
	.EN (en2),
	.D (WDATA),
	.Q (q2)
);
REG #(32) R3 (
	.CLK (CLK),
	.RST (RST),
	.EN (en3),
	.D (WDATA),
	.Q (q3)
);
REG #(32) R4 (
	.CLK (CLK),
	.RST (RST),
	.EN (en4),
	.D (WDATA),
	.Q (q4)
);
REG #(32) R5 (
	.CLK (CLK),
	.RST (RST),
	.EN (en5),
	.D (WDATA),
	.Q (q5)
);
REG #(32) R6 (
	.CLK (CLK),
	.RST (RST),
	.EN (en6),
	.D (WDATA),
	.Q (q6)
);
REG #(32) R7 (
	.CLK (CLK),
	.RST (RST),
	.EN (en7),
	.D (WDATA),
	.Q (q7)
);
REG #(32) R8 (
	.CLK (CLK),
	.RST (RST),
	.EN (en8),
	.D (WDATA),
	.Q (q8)
);
REG #(32) R9 (
	.CLK (CLK),
	.RST (RST),
	.EN (en9),
	.D (WDATA),
	.Q (q9)
);
REG #(32) R10 (
	.CLK (CLK),
	.RST (RST),
	.EN (en10),
	.D (WDATA),
	.Q (q10)
);
REG #(32) R11 (
	.CLK (CLK),
	.RST (RST),
	.EN (en11),
	.D (WDATA),
	.Q (q11)
);
REG #(32) R12 (
	.CLK (CLK),
	.RST (RST),
	.EN (en12),
	.D (WDATA),
	.Q (q12)
);
REG #(32) R13 (
	.CLK (CLK),
	.RST (RST),
	.EN (en13),
	.D (WDATA),
	.Q (q13)
);
REG #(32) R14 (
	.CLK (CLK),
	.RST (RST),
	.EN (en14),
	.D (WDATA),
	.Q (q14)
);
REG #(32) R15 (
	.CLK (CLK),
	.RST (RST),
	.EN (en15),
	.D (WDATA),
	.Q (q15)
);
REGMUX REGDECODER1 (
	.ADDR (RADDR1_R),
	.IN0 (q0),
	.IN1 (q1),
	.IN2 (q2),
	.IN3 (q3),
	.IN4 (q4),
	.IN5 (q5),
	.IN6 (q6),
	.IN7 (q7),
	.IN8 (q8),
	.IN9 (q9),
	.IN10 (q10),
	.IN11 (q11),
	.IN12 (q12),
	.IN13 (q13),
	.IN14 (q14),
	.IN15 (q15),
	.OUT (RDATA1)
); // REGMUX? ???? ?? ADDR? ??? 4??? ??? OUT?? !N0~IN15? ?? ?? ??? ?????. ?? REGDECODER2? ?? ??
REGMUX REGDECODER2 (
	.ADDR (RADDR2_R),
	.IN0 (q0),
	.IN1 (q1),
	.IN2 (q2),
	.IN3 (q3),
	.IN4 (q4),
	.IN5 (q5),
	.IN6 (q6),
	.IN7 (q7),
	.IN8 (q8),
	.IN9 (q9),
	.IN10 (q10),
	.IN11 (q11),
	.IN12 (q12),
	.IN13 (q13),
	.IN14 (q14),
	.IN15 (q15),
	.OUT (RDATA2)
);
DECODER DEC1to16 (
	.DI (W_EN),
	.SEL (RADDR3_W),
	.DO0 (en0),
	.DO1 (en1),
	.DO2 (en2),
	.DO3 (en3),
	.DO4 (en4),
	.DO5 (en5),
	.DO6 (en6),
	.DO7 (en7),
	.DO8 (en8),
	.DO9 (en9),
	.DO10 (en10),
	.DO11 (en11),
	.DO12 (en12),
	.DO13 (en13),
	.DO14 (en14),
	.DO15 (en15)
); // DECODER? ???? ??, 4??? SEL??? DO0~DO15 ? ????? DI? ??? ? ??? ????.
endmodule