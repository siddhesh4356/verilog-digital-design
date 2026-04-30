module demux_14(
    input Z,
    input S1,
    input S0,
    output [3:0] D
);

assign D[0] = Z&~S1&~S0;
assign D[1] = Z&~S1&S0;
assign D[2] = Z&S1&~S0;
assign D[3] = Z&S1&S0;

endmodule
