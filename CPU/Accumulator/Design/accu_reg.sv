module acc_reg #(parameter N=4)
(
 input logic clk,rst,accu_load,  //holds in the value
 input logic [N-1:0] alu_result,  //Parameterises ALU result
 output logic [N-1:0] accu_out   //Loads into the new value
);

always_ff @(posedge clk)begin
if (rst)
  accu_out<='0;
else if(accu_load)
  accu_out<=alu_result;

end
endmodule
