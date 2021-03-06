module CORE(
input wire CLK,
input wire RST,
// Instruction Memory
output wire [31:0] IADDR, //IMemory address
input wire [15:0] INSTR, //IMemory read data(Instruction)
// Data Memory
output wire [31:0] DADDR, //DMemory address
output wire DnRW, //DMemory write enable
output wire [31:0] DWDATA, //DMemory write data
input wire [31:0] DRDATA //DMemory read data
);
//IF
wire [31:0] pc_inc2; //pc + 2
wire [31:0] pc_inc4; //pc + 4
wire [31:0] pc_d;
wire [31:0] pc_q;
wire [15:0] instr;

//ID
   wire   [3:0]   raddr1_r;   //Register address1 - read
   wire   [3:0]   raddr2_r;   //Register address2 - read
   wire   [3:0]   raddr3_w;   //Register address3 - write
   
   wire    [31:0]   rdata1;    //Register data1
   wire    [31:0]   rdata2;    //Register data2
   
   wire   [31:0]   imm3_ex;   //extended imm3 
   wire   [31:0]   imm5_ex;   //extended imm5 
   wire   [31:0]   imm8_ex;   //extended imm8
   wire   [31:0]   imm11_ex;   //extended imm11
   wire   [31:0]   imm_ex;      //extended imm

   //CONTROL PATH
   wire   [3:0]   regsel;   //Address selection
   wire   [3:0]   immsel;    //Immediate selection   
   wire   [3:0]   nzcvwrite;   //NZCV Register write enable 
   wire         regbranch;   //Register branch enable 
   wire   [3:0]   cond;      //Condition 
   wire         memrw;      //DMemory read/write selection
   wire         memtoreg;   //DMemory load enable
   wire   [3:0]   alu_op;      //ALU operation signal
   wire         alu_src;   //ALU input selection
   wire         regwrite;   //Register write enable
   wire         bsel;      //Branch Address selection
   wire         c_branch;   //Conditional Branch enable
   
//EX
   wire   [31:0]   alu_in_x;   //ALU operand1
   wire   [31:0]   alu_in_y;   //ALU operand2
   wire   [31:0]   alu_out;   //ALU output
   wire   [31:0]   pc_imm_b;   //Branch target address(Immediate)
   wire   [31:0]   pc_b;      //Branch target address(Total)
   wire    [3:0]   nzcv_d;      //NZCV Register D
   wire   [3:0]   nzcv_q;      //NZCV Register Q
   
   wire         nzcv_check;   //NZCV Check output
   wire         en_cb;      //Conditional branch enable
   wire         en_b;      //PC selection
   
//MEM
   wire   [31:0]   mdata_r;   //DMemory data - read

//WB
   wire   [31:0]   wbdata;      //Write back data
   
/////////////////////////////////////
// IF START
/////////////////////////////////////

// PC REG
REG #(32) PC_REG (
.CLK (CLK),
.RST (RST),
.EN (1'b1),
.D (pc_d),
.Q (pc_q)
);

// PC INCREMENTER 2
ADDER #(32) PC_ADD_2 (
.A (pc_q),
.B (2),
.C_IN (1'b0),
.SUM (pc_inc2),
.C_OUT (CO)
);

ADDER #(32) PC_ADD_4 (
.A (pc_q),
.B (4),
.C_IN (1'b0),
.SUM (pc_inc4),
.C_OUT (CO)
);

// INSTRUCTION ADDR
assign IADDR = pc_q;

// INSTRUCTION READ
assign instr = INSTR;

/////////////////////////////////////
// IF END
/////////////////////////////////////

/////////////////////////////////////
// ID START
/////////////////////////////////////

/*********************************************
SEL          0001     0010     0100     1000   
RADDR1_R       [2:0]     [5:3]       x     [5:3]
RADDR2_R       [5:3]     [8:6]   [6:3]   [2:0]
RADDR3_W       [2:0]     [2:0]       x     [2:0]
**********************************************/


// WRITE REGISTER ADDRESS 
assign raddr3_w = {1'b0,instr[2:0]};

// READ REGISTER ADDRESS 1

MUX4to1 #(4) R_ADDR_1(
.DI0({1'b0,instr[2:0]}),
.DI1({1'b0,instr[5:3]}),
.DI2(),
.DI3({1'b0,instr[5:3]}),
.SEL(regsel),
.DO(raddr1_r)
);

// READ REGISTER ADDRESS 2

MUX4to1  #(4) R_ADDR_2 (
.DI0({1'b0,instr[5:3]}),
.DI1({1'b0,instr[8:6]}),
.DI2(instr[6:3]),
.DI3({1'b0,instr[2:0]}),
.SEL(regsel),
.DO(raddr2_r)
);

// IMM EXTENSION
IMMEXTENSION   IMMEXTENSION(
.IMM3(instr[8:6]),
.IMM5(instr[10:6]),
.IMM8(instr[7:0]),
.IMM11(instr[10:0]),
.IMM3_EX(imm3_ex),
.IMM5_EX(imm5_ex),
.IMM8_EX(imm8_ex),
.IMM11_EX(imm11_ex)
);

// CONTROL PATH GENERATOR
CP_GEN         CP_GEN (
   .OPCODE      (instr[15:6]),
   .REGSEL      (regsel),
   .IMMSEL      (immsel),
   .NZCVWRITE   (nzcvwrite),
   .R_BRANCH   (regbranch),
   .COND      (cond),
   .MEMRW      (memrw),
   .MEMTOREG   (memtoreg),
   .ALUOP      (alu_op),
   .ALUSRC      (alu_src),
   .REGWRITE   (regwrite),
   .BSEL      (bsel),
   .C_BRANCH   (c_branch)      
);

// GENERAL PURPOSE REGISTER
REGFILE         REGFILE(
.CLK      (CLK),
.RST      (RST),
.W_EN      (regwrite),
.RADDR1_R   (raddr1_r),
.RADDR2_R   (raddr2_r),
.RADDR3_W   (raddr3_w),
.WDATA      (wbdata),
.RDATA1      (rdata1),
.RDATA2      (rdata2)
);




//IMM MUX_CTRL
//0001 : imm3_ex
//0010 : imm5_ex
//0100 : imm8_ex
//1000 : imm11_ex



// IMM MUX
MUX4to1 #(32)    IMM_MUX(
   .DI0      (imm3_ex),
   .DI1      (imm5_ex),
   .DI2      (imm8_ex),
   .DI3      (imm11_ex),
   .SEL      (immsel),
   .DO      (imm_ex)
);


/////////////////////////////////////
// ID END
/////////////////////////////////////

/////////////////////////////////////
// EX START
/////////////////////////////////////


// ALU INPUT
assign alu_in_x = rdata1;

MUX2to1 #(32)    ALU_IN_Y(
   .DI0      (rdata2),
    .DI1      (imm_ex),
    .SEL      (alu_src),
    .DO         (alu_in_y)
);

// ALU
ALU      ALU(
   .OP_X      (alu_in_x),
   .OP_Y      (alu_in_y),
   .ALU_CTRL   (alu_op),
   .ALU_OUT   (alu_out),
   .NZCV      (nzcv_d)

);





// NZCV REG
NZCV_REG #(4)   NZCV_REG (
    .CLK      (CLK),
    .RST      (RST),
    .EN         (nzcvwrite),
    .D         (nzcv_d),
    .Q         (nzcv_q)
);   


// NZCV CHECK
NZCV_CHECK      NZCV_CHECK(
   .NZCV      (nzcv_q),
   .COND      (cond),
   .OUT      (nzcv_check)
);

// PC ADDER - BRANCH
ADDER #(32)      PC_ADD_B (
    .A         (pc_inc4),
    .B         (imm_ex),
   .C_IN      (1'b0),
    .SUM      (pc_imm_b),
    .C_OUT      (CO)
);


// PC SEL MUX signal
and(en_cb, c_branch, nzcv_check);
or(en_b, regbranch, en_cb);



// BRANCH TARGET ADDRESS MUX
MUX2to1 #(32)    PC_B_MUX(
   .DI0      (pc_imm_b),
    .DI1      (rdata2),
    .SEL      (bsel),
    .DO         (pc_b)
);

//PC_D MUX
MUX2to1 #(32) PC_D_MUX(
   .DI0      (pc_inc2),
    .DI1      ({pc_b[31:1],1'b0}),
    .SEL      (en_b),
    .DO         (pc_d)
);

/////////////////////////////////////
// EX END
/////////////////////////////////////

/////////////////////////////////////
// MEM START
/////////////////////////////////////

// MEM W/R 
assign DnRW = memrw;

// MEM ADDR
assign DADDR = alu_out; 

// MEM WRITE
assign DWDATA = rdata2;

// MEM READ
assign mdata_r = DRDATA;

/////////////////////////////////////
// MEM END
/////////////////////////////////////

/////////////////////////////////////
// WB START
/////////////////////////////////////

// WB MUX
MUX2to1 #(32) WB_MUX(
   .DI0      (DADDR),
    .DI1      (mdata_r),
    .SEL      (memtoreg),
    .DO         (wbdata)
);

/////////////////////////////////////
// WB END
/////////////////////////////////////

endmodule
