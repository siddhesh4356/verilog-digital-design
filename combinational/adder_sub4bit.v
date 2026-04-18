module adder_sub4bit(
input[3:0] A,
input[3:0] B,
input M,
output[3:0] Result,
output Cout
);
wire[3:0] B_mod;
wire C1,C2,C3;
assign B_mod=B^{4{M}};
full_adder fa0 (A[0],B_mod[0],M,Result[0],C1);
full_adder fa1 (A[1],B_mod[1],C1,Result[1],C2);
full_adder fa2 (A[2],B_mod[2],C2,Result[2],C3);
full_adder fa3 (A[3],B_mod[3],C3,Result[3],Cout);

endmodule
