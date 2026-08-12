module comparator #(parameter N = 4)(
    input  [N-1:0] A,
    input  [N-1:0] B,
    output reg G,
    output reg L,
    output reg E
);

integer i;

always @(*) begin : COMPARE_BLOCK
    G  = 0;
    L  = 0;
    E = 0;

    for (i = N-1; i >= 0; i = i - 1) begin
        
        if (A[i] > B[i]) begin
            G = 1;
            disable COMPARE_BLOCK;
        end
        
        else if (A[i] < B[i]) begin
            L = 1;
            disable COMPARE_BLOCK;
        end
    end

    // If loop completes → equal
    E = 1;
end

endmodule
