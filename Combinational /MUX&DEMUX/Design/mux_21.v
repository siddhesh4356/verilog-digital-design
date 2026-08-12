module mux_21(
input D0,
input D1,
input S,
output Z
);

assign Z=(D0&~S)|(D1&S);
endmodule
