module ARMv6 (
input wire CLK, // Clock
input wire RST // Reset
);
// INSTRUCTION MEMORY
wire [15:0] instr;
wire [31:0] iaddr;
// DATA MEMORY
wire [31:0] daddr;
wire drw; //Read:0, Write:1
wire [31:0] dwdata;
wire [31:0] drdata;
// CLOCK
wire mem_clk;
wire core_clk;
// SLOW CLOCK
CLK_GEN CLK_GEN(
.ICLK (CLK),
.RST (RST),
.OCLK (core_clk)
);
//MEMORY CLOCK
assign mem_clk = CLK;
// CORE
CORE Processor(
.CLK (core_clk), // CLOCK
.RST (RST), // ASYNC. RESET
// INSTRUCTION MEMORY
.IADDR (iaddr), // IMEM. ADDRESS
.INSTR (instr), // INSTRUCTION
// DATA MEMORY
.DADDR (daddr), // DMEM. ADDRESS
.DnRW (drw), // DMEM. READ/WRITE
.DWDATA (dwdata), // DMEM. WRITE DATA
.DRDATA (drdata) // DMEM. READ DATA
);
// INSTRUCTION MEMORY
SRAM #(.ROMDATA("Task4.hex"), .WIDTH(16) ) IMEM(
.CLK (mem_clk),
.ADDR (iaddr[10:1]),
.WEN (1'b0),
.DO (instr),
.DI (16'b0)
);
// DATA MEMORY
SRAM DMEM(
.CLK (mem_clk),
.ADDR (daddr[11:2]),
.WEN (drw),
.DO (drdata),
.DI (dwdata)
);
endmodule
