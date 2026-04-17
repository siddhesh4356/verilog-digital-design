module test;
reg A, B,Cin;
wire Y;
full_adder uut(
.A(A),
.B(B),
.Cin(Cin),
.sum(sum),
.carry(carry)
);

initial begin
$dumpfile("wave.vcd");
$dumpvars(0,test);
A=0;B=0;Cin=0;#10;
A=0;B=0;Cin=1;#10;
A=0;B=1;Cin=0;#10
A=0;B=1;Cin=1;#10
A=1;B=0;Cin=0;#10
A=1;B=0;Cin=1;#10
A=1;B=1;Cin=0;#10
A=1;B=1;Cin=1;#10

#10 $finish;
end

endmodule
