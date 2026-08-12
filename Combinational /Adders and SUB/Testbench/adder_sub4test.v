module testbench;

reg [3:0] A, B;
reg M;
wire [3:0] Result;
wire Cout;

adder_sub4bit uut (
    .A(A),
    .B(B),
    .M(M),
    .Result(Result),
    .Cout(Cout)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);

    A = 4'b0011; B = 4'b0001; M = 0; #10; 
    A = 4'b0101; B = 4'b0010; M = 0; #10; 
    A = 4'b0101; B = 4'b0011; M = 1; #10;
    A = 4'b0110; B = 4'b0001; M = 1; #10; 
    A = 4'b0000; B = 4'b0001; M = 1; #10;
    A = 4'b1111; B = 4'b0001; M = 0; #10;

    #10 $finish;
end

endmodule
