module even_odd(
    input A, B, C,
    output F_odd, F_even
);

assign F_odd  = A ^ B ^ C;
assign F_even = ~(A ^ B ^ C);

endmodule
