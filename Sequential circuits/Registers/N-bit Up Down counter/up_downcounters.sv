//Module to implement an N-bit Up-down counter 
module up_downcounter #(
  parameter N=4
  )(
  input logic clk,rst,
  input logic mode,   //Depending on this the counter can count up or down mode=0:-Up    mode =1:-Down
  output logic [N-1:0] q
  
  );
 
 
 always_ff @(posedge clk or posedge rst)begin
 if(rst)
    q<='0;
else if(!mode) begin  //Since mode =1 at first which would perform downcount  
    q<=q+1;   //Performs upcount
    end
else
   q<=q-1;     //Performs downcount
   
   end
   endmodule

