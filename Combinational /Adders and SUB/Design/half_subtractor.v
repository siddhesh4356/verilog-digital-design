module half_subtractor(
 input A,
input B,
output Diff,
output borrow
);
assign Diff=A^B;
assign borrow=(~A&B);
endmodule
