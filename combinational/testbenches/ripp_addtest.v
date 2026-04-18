module testbench;

reg [3:0] A;
reg [3:0] B;
reg Cin;
wire [3:0] Sum;
wire Cout;

ripp_adder4 uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);

    A = 4'b0000; B = 4'b0000; Cin = 0; #10;
    A = 4'b0001; B = 4'b0001; Cin = 0; #10;
    A = 4'b0111; B = 4'b0001; Cin = 0; #10;
    A = 4'b1111; B = 4'b0001; Cin = 0; #10;
    A = 4'b1010; B = 4'b0101; Cin = 1; #10;
    A = 4'b1111; B = 4'b1111; Cin = 1; #10;

    #10 $finish;
end

endmodule
