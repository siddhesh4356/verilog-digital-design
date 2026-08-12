module enable_nbit #(parameter N=4)
(
 input logic clk,rst,en,
 input logic [N-1:0] Din,  //Parameterises D and Q and any N-bit 
 output logic [N-1:0] q
);

always_ff @(posedge clk)begin
if (rst)
  q<='0;
else if(en)
  q<=Din;

end
endmodule
