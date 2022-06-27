module SRAM #(parameter ROMDATA ="",
AWIDTH = 10,
DEPTH = 1024,
WIDTH = 32) (
   input wire CLK,
   input wire [AWIDTH-1:0] ADDR,
   input wire WEN,
   input wire [WIDTH-1:0] DI,
   output wire [WIDTH-1:0] DO
);
   reg [WIDTH-1:0] outline;
   reg [WIDTH-1:0] ram[0 :DEPTH-1];
initial
   begin
   if (ROMDATA != "")
       $readmemh(ROMDATA, ram);
end
assign DO = outline;
always @ (posedge CLK)
   begin
   if (WEN)
   ram[ADDR] = DI;
   else
   outline = ram[ADDR];
   end
endmodule
