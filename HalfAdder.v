module HalfAdder(sum,carry,x,y);

output wire sum,carry;
input wire x,y;

xor (sum,x,y);
and (carry,x,y);

endmodule