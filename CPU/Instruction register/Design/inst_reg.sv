module inst_reg #(parameter N=4)
(
 input logic clk,rst,inst_load,
 input logic [N-1:0] inst_in,  //Parameterises input instruction and output
 output logic [N-1:0] inst_out
);

always_ff @(posedge clk)begin
if (rst)
  inst_out<='0;
else if(inst_load)
  inst_out<=inst_in;

end
endmodule
