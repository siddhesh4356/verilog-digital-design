module d_latch (
    input  logic D,
    input logic EN,
    output logic Q
    
);

always_latch begin
 if(EN)
Q<=D;
     
end

endmodule
