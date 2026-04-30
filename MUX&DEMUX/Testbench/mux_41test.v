module test;

reg D0, D1, D2, D3;
reg S1, S0;
wire Y;

mux_41 uut(
    .D0(D0), .D1(D1), .D2(D2), .D3(D3),
    .S1(S1), .S0(S0),
    .Y(Y)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, test);

    // set data
    D0=0; D1=1; D2=0; D3=1;

    S1=0; S0=0; #10;
    S1=0; S0=1; #10;
    S1=1; S0=0; #10;
    S1=1; S0=1; #10;

    $finish;
end

endmodule
