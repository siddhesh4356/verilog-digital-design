module test;
reg[2:0] in; //Z,S1,S0
wire[3:0] D;

demux_14 uut(
 .Z(in[0]),
 .S1(in[1]),
 .S0(in[2]),
 .D(D)
);
 
integer i; //initalising a counter variable to go through the 8 case scenarios for 1:4 DEMUX

initial begin
$dumpfile("wave.vcd");
$dumpvars(0,test);

for(i=0;i<8;i++)begin
in=i;
#10;
end
#10 $finish;
end
endmodule




