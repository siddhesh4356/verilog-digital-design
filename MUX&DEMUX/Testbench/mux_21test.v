module test ;
reg D0,D1,S;
wire Z;
mux_21 uut(
.D0(D0),
.D1(D1),
.S(S),
.Z(Z)
);
initial begin
$dumpfile("wave.vcd");
$dumpvars(0,test);

D0=0; D1=0; S=0; #10; //Should be Z=0
D0=0; D1=1; S=0; #10; //Should be Z=0
D0=1; D1=0; S=0; #10; //Should be Z=1
D0=1; D1=1; S=0; #10; //Should be Z=1

D0=0; D1=0; S=1; #10; //Should be Z=0
D0=0; D1=1; S=1; #10; //Should be Z=1
D0=1; D1=0; S=1; #10; //Should be Z=0
D0=1; D1=1; S=1; #10; //Should be Z=1

#10 $finish ;
end
endmodule
