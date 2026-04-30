module test;
reg A, B;
wire Y;
xor_gate uut(
.A(A),
.B(B),
.Y(Y)
);

initial begin
$dumpfile("wave.vcd");
$dumpvars(0,test);
A=0;B=0;#10;
A=0;B=1;#10;
A=1;B=0;#10;
A=1;B=1;#10;

#10 $finish;
end

endmodule
