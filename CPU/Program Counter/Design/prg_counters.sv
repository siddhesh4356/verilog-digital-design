//Module to implement a Program Counter
module prg_counter #(
  parameter N=4
  )(
  input logic clk,rst,prg_inc,pc_load,       //pc_load :-to load in a new address ,
                                            // prg_inc:-if true then incrementation takes place ,
  input logic [N-1:0] pc_in,                //prg_count :-actually does the incrementation
  output logic [N-1:0] prg_count            //prg_in:-stores the address
  
  );
 
 
 always_ff @(posedge clk or posedge rst)begin
 if (rst)
    prg_count <= '0;
else if (pc_load)
    prg_count <= pc_in;
else if (prg_inc)
    prg_count <= prg_count + 1;
end 
endmodule
