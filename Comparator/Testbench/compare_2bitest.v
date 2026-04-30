module test;

reg [3:0] in;   // A1 A0 B1 B0
wire L, E, G;

compare_2bit uut(
    .A1(in[3]),
    .A0(in[2]),
    .B1(in[1]),
    .B0(in[0]),
    .L(L),
    .E(E),
    .G(G)
);

integer i;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, test);

    for(i = 0; i < 16; i++) begin
        in = i;
        #10;
    end

    #10 $finish;
end

endmodule
