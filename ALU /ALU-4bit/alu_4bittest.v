module alu_4bit_tb;

    reg [3:0] A, B;
    reg [1:0] opcode;

    wire [3:0] Result;
    wire C, Z, S, V;

    // Instantiate ALU
    alu_4bit uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .Result(Result),
        .C(C),
        .Z(Z),
        .S(S),
        .V(V)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_4bit_tb);

        // ADD
        A = 4'b0101; B = 4'b0011; opcode = 2'b00; #10;
        A = 4'b1111; B = 4'b0001; opcode = 2'b00; #10;

        // SUB
        A = 4'b0101; B = 4'b0011; opcode = 2'b01; #10;
        A = 4'b0011; B = 4'b0101; opcode = 2'b01; #10;

        // AND
        A = 4'b1100; B = 4'b1010; opcode = 2'b10; #10;

        // OR
        A = 4'b1100; B = 4'b1010; opcode = 2'b11; #10;

        // ZERO case
        A = 4'b0000; B = 4'b0000; opcode = 2'b00; #10;

        // SIGN test
        A = 4'b1000; B = 4'b0001; opcode = 2'b01; #10;

        #10 $finish;
    end

endmodule
