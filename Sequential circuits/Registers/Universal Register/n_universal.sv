//Code to test N-bit modular universal shift register hardware
module n_universal #(parameter N=4)
(
 input logic clk,rst,
 input logic [1:0]opcode,    //Block to describe the simulation of N-bit universal shift register 
 input logic [N-1:0]Din,
 input logic left_shift,right_shift,         //Declares left_shift and right_shift              //Inputs clock,reset and enable 
 output logic[N-1:0]q        //Array DFF inputs similarly for output
 );                         //opcode array to enable selection in multiplexer containing 4 operations HOLD,LS,RS and //el loading 
 
 always_ff @(posedge clk or posedge rst)begin
 if (rst) begin
    q<='0;
    end
else
begin case(opcode)
     2'b00:
     begin
     q<=q; //HOLD
     end
     
     2'b01:  //Right Shift
     begin 
     for(int i=0;i<N-1;i++)
         q[i]<=q[i+1];
         
    q[N-1]<=right_shift;
    end
     
     2'b10:  //Left shift
     begin
     for(int i=N-1;i>0;i--)
        q[i]<=q[i-1];
        
    q[0]<=left_shift;
    end
    
    2'b11: //Parallel input
    begin
    q<=Din;
    end
    
    default:
    begin
    q<=q;
    end
    endcase
 end
 end
 endmodule
