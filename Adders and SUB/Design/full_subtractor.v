module full_subtractor(
 input A,
input B,
input Bin,
output diff,
output borrow
);
assign diff=A^B^Bin;
assign borrow=(~A&B)|(B&Bin)|(~A&Bin);
endmodule
