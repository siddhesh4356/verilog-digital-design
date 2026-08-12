module bit_4shift(
 input logic clk,Din,rst,
 output logic [0:3]q
);

always_ff @(posedge clk)begin
if(rst)
   q<=4'b0000;
else begin
  q[3]<=q[2];
  q[2]<=q[1];
  q[1]<=q[0];
  q[0]<=Din;
end
end
endmodule
