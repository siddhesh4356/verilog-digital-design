module compare_2bit(
    input A1, A0,
    input B1, B0,
    output L, E, G
);

// Equal
assign E = (~(A1 ^ B1)) & (~(A0 ^ B0));

// Greater
assign G = (A1 & ~B1) | ((~(A1 ^ B1)) & (A0 & ~B0));

// Less
assign L = (~A1 & B1) | ((~(A1 ^ B1)) & (~A0 & B0));

endmodule

