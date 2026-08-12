module test;

parameter N = 4;

reg  [N-1:0] A, B;
wire G, L, EQ;

// Instantiate comparator
comparator #(N) uut (
    .A(A),
    .B(B),
    .G(G),
    .L(L),
    .EQ(EQ)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, test);

    // Test cases

    A = 4'b1010; B = 4'b1001; #10; // A > B
    A = 4'b0011; B = 4'b0100; #10; // A < B
    A = 4'b0111; B = 4'b0111; #10; // A == B
    A = 4'b0000; B = 4'b1111; #10; // A < B
    A = 4'b1111; B = 4'b0000; #10; // A > B

    #10 $finish;
end

endmodule
