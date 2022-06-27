module ALU (
    input wire [31:0] OP_X,
    input wire [31:0] OP_Y,
    input wire [3:0] ALU_CTRL,
    output reg [3:0] NZCV,
    output wire [31:0] ALU_OUT
    );// ????? ??? OP_X, OP_Y 4?? ???? ALU_CTRL, ???? NZCV(?????), ALU_OUT(????) ??
    wire [31:0] or_out;
    wire [31:0] xor_out;
    wire [31:0] and_out;
    wire [31:0] add_out;
    wire add_cout;
// or, xor, and, add ?? ??? ??? or_out, xor_out, and_out, add_out? ?? ??? ??? add_cout??

    assign add_out = OP_X + OP_Y;
    assign and_out = OP_X & OP_Y;
    assign xor_out = OP_X ^ OP_Y;
    assign or_out = OP_X | OP_Y;
// ??? ????? ?? ?? ??

    MUX4to1 #(32) MUX_OUT (
    .DI0 (add_out),
    .DI1 (and_out),
    .DI2 (xor_out),
    .DI3 (or_out),
    .SEL (ALU_CTRL),
    .DO (ALU_OUT)
    );//MUX? ???? ?? 

always @ (ALU_CTRL)
    begin
    NZCV[3] = ALU_OUT[31];
    if(ALU_OUT) 
        NZCV[2] = 0;
    else if(!ALU_OUT) 
        NZCV[2] = 1;
    if(OP_X>0 && OP_Y>0&&add_out<0) 
            NZCV[0] = 1;
    else if(OP_X<0 && OP_Y<0&&add_out>0)
  	 NZCV[0] = 1;
    else
        NZCV[0] = 0;
    end

    endmodule//NZCV GENERATOR ?? ?? ?? ???? NZCV ?? ???? 

