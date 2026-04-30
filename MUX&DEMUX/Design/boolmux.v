//Implementing XOR using 8:1 MUX with 3 select lines namely A,B,C
module boolmux(
    input A,
    input B,
    input C,
    output F
);

assign F = A ^ B ^ C;

endmodule
