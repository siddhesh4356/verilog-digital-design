module mux_41(
    input D0, D1, D2, D3,
    input S1, S0,
    output Y
);

assign Y = (~S1 & ~S0 & D0) |
           (~S1 &  S0 & D1) |
           ( S1 & ~S0 & D2) |
           ( S1 &  S0 & D3);

endmodule
