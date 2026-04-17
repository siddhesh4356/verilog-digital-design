module full_adder(
 input A,
input B,
input Cin,
output sum,
output carry
);
assign sum=A^B^Cin;
assign carry=(A&B)|(B&Cin)|(A&Cin);
endmodule
