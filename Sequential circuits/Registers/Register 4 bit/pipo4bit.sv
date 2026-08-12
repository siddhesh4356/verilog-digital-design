module para4bit(
 input logic clk,rst,
 input logic [3:0]Din,
 output logic [3:0]q
);

always_ff @(posedge clk)begin
if(rst)
  q<=4'b0000;
else begin
  q[3]<=Din[3];
  q[2]<=Din[2];
  q[1]<=Din[1];
  q[0]<=Din[0];
end

end
endmodule
