module test;

reg A, B, C;
wire F;
boolmux  uut (
    .A(A),
    .B(B),
    .C(C),
    .F(F)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, test);
    //This maps the outputs to D0-D7 respectively.
    A=0; B=0; C=0; #10; // F=0 
    A=0; B=0; C=1; #10; // F=1
    A=0; B=1; C=0; #10; // F=1
    A=0; B=1; C=1; #10; // F=0
    A=1; B=0; C=0; #10; // F=1
    A=1; B=0; C=1; #10; // F=0
    A=1; B=1; C=0; #10; // F=0
    A=1; B=1; C=1; #10; // F=1

    #10 $finish;
end

endmodule
