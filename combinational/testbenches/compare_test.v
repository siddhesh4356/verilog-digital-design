module test;
reg A0,B0;
wire L,E,G;
compare_1bit uut (
.A0(A0),
.B0(B0),
.L(L),
.E(E),
.G(G)
);

initial begin
$dumpfile("wave.vcd");
$dumpvars(0,test);

A0=0; B0=0; #10;
A0=0; B0=1; #10;
A0=1; B0=0; #10;
A0=1; B0=1; #10;

#10 $finish;
end

endmodule


