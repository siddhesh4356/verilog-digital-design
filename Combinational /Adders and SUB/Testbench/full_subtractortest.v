module test;
reg A, B,Bin;
wire Y;
full_subtractor uut(
.A(A),
.B(B),
.Bin(Bin),
.Diff(Diff),
.borrow(borrow)
);

initial begin
$dumpfile("wave.vcd");
$dumpvars(0,test);
A=0;B=0;Bin=0;#10;
A=0;B=0;Bin=1;#10;
A=0;B=1;Bin=0;#10
A=0;B=1;Bin=1;#10
A=1;B=0;Bin=0;#10
A=1;B=0;Bin=1;#10
A=1;B=1;Bin=0;#10
A=1;B=1;Bin=1;#10

#10 $finish;
end

endmodule
