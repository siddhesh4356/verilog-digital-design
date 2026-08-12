module d_ff(
  input logic clk,rst,d,
  output logic q
);

always_ff @(posedge clk)begin
if(rst)
  q<=1'b0;
else
  q<=d;
end

endmodule
