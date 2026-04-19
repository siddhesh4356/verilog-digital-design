module test;
reg Z,S;
wire D1,D0;
demux_21 uut(
.D1(D1),
.D0(D0),
.S(S),
.Z(Z)
);

initial begin 
$dumpfile("wave.vcd");
$dumpvars(0,test);
//test cases
Z=0;S=0; #10; //DEMUX routes input Z to exactly one output based on S
                    //and forces other to 0 
Z=1;S=0; #10;

Z=0;S=1; #10;
Z=1;S=1; #10; 

#10 $finish;

end
endmodule



