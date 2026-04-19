module compare_1bit(
 input A0,
 input B0,
 output L,
 output E,
 output G
);
assign L=~A0&B0;
assign E=~(A0 ^B0);
assign G=A0&~B0;

endmodule
