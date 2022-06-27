module CP_GEN (
   input wire [9:0] OPCODE,
   output wire [3:0] REGSEL,
   output wire [3:0] IMMSEL,
   output wire [3:0] NZCVWRITE,
   output wire R_BRANCH,
   output wire [3:0] COND,
   output wire MEMRW,
   output wire MEMTOREG,
   output wire [3:0] ALUOP,
   output wire ALUSRC,
   output wire REGWRITE,
   output wire BSEL,
   output wire C_BRANCH
);
reg [26:0] cp;
assign {REGSEL, IMMSEL, NZCVWRITE, R_BRANCH, COND, MEMRW,MEMTOREG, ALUOP, ALUSRC, REGWRITE, C_BRANCH , BSEL} = cp;
   always @(*)
   casex(OPCODE)
      10'b0100000000: cp <=27'b0001xxxx11100xxxx000100010x;   //AND
      10'b0100001100: cp <=27'b0001xxxx11100xxxx000001010x;   //ORR
      10'b0100000001: cp <=27'b0001xxxx11100xxxx000010010x;   //EOR    
           10'b0001110xxx:   cp <=27'b1000000111110xxxx001000110x;   //ADDI
           10'b0001100xxx:   cp <=27'b0010xxxx11110xxxx001000010x;   //ADD
      10'b01100xxxxx:   cp <=27'b1000001000000xxxx1x1000100x;   //STR
      10'b01101xxxxx:   cp <=27'b1000001000000xxxx011000110x;   //LDR
      10'b010011100x:   cp <=27'b0100xxxx00001xxxx0xxxxxx001;   //BX
      10'b11010000xx:   cp <=27'bxxxx01000000000000xxxxxx010;   //BEQ
      10'b11010001xx:   cp <=27'bxxxx01000000000010xxxxxx010;   //BNE
      10'b11010010xx:   cp <=27'bxxxx01000000000100xxxxxx010;   //BCS
      10'b11010011xx:   cp <=27'bxxxx01000000000110xxxxxx010;   //BCC
      10'b11010100xx:   cp <=27'bxxxx01000000001000xxxxxx010;   //BMI
      10'b11010101xx:   cp <=27'bxxxx01000000001010xxxxxx010;   //BPL
      10'b11010110xx:   cp <=27'bxxxx01000000001100xxxxxx010;   //BVS
      10'b11010111xx:   cp <=27'bxxxx01000000001110xxxxxx010;   //BVC
      10'b11011000xx:   cp <=27'bxxxx01000000010000xxxxxx010;   //BHI
      10'b11011001xx:   cp <=27'bxxxx01000000010010xxxxxx010;   //BLS
      10'b11011010xx:   cp <=27'bxxxx01000000010100xxxxxx010;   //BGE
      10'b11011011xx:   cp <=27'bxxxx01000000010110xxxxxx010;   //BLT
      10'b11011100xx:   cp <=27'bxxxx01000000011000xxxxxx010;   //BGT
      10'b11011101xx:   cp <=27'bxxxx01000000011010xxxxxx010;   //BLE
      10'b11100xxxxx:   cp <=27'bxxxx100000001xxxx0xxxxxx000;   //BAL
      default:    cp <=27'bxxxxxxxx00000xxxx0xxxxxx00x;   //default
      endcase
endmodule