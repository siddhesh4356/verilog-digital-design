//Code to test N-bit Ring counters and Johnson counters
module n_ring_johnson #(parameter N=4)
(
 input logic clk,rst,
 input logic opcode,    //Block to describe the simulation of N-bit universal shift register 
                         //Inputs clock,reset and enable 
 output logic[N-1:0]q        //Array DFF inputs similarly for output
 );                         //opcode array to enable selection in multiplexer containing 4 operations HOLD,LS,RS and //el loading 
 
 always_ff @(posedge clk or posedge rst)begin
 if (rst) begin
    q<='0;
    q[0]<=1'b1;  //Sets an initial state for the counters to start from.
    end
else
begin case(opcode)
    
     
     1'b0:  //ring OP:- 0001,0010,0100,1000,0001
     begin 
     for(int i=0;i<N-1;i++)
         q[i]<=q[i+1];
         
    q[N-1]<=q[0];
    end
     
     1'b1:  //johnson Op:- 0001,0011,0111,1111,1110,1100,1000,0001
     begin
      for(int i=0;i<N-1;i++)
         q[i]<=q[i+1];
         
    q[N-1]<= ~q[0];
    end
    endcase
 end
 end
 endmodule
