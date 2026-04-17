module test;
reg A;
wire Y;
not_gate uut(
.A(A),
.Y(Y)
);

initial begin
$dumpfile("wave.vcd");
$dumpvars(0,test);
A=0;#10;
A=1;#10;

#10 $finish;
end

endmodule
