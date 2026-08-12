module demux_21(
 input Z,
 input S,
 output D0,
 output D1
);

assign D0=Z&~S;
assign D1=Z&S;
endmodule
