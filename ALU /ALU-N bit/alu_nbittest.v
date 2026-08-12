module test_nbit_alu();

    parameter N = 4;

    reg [N-1:0] A, B;
    reg [2:0] opcode;

    wire [N-1:0] Result;
    wire C, S, V, Z;

    // Instantiate ALU
    alu_nbit #(N) uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .Result(Result),
        .C(C),
        .S(S),
        .V(V),
        .Z(Z)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, test_nbit_alu);

        // ADD
        A = 4'd5; B = 4'd3; opcode = 3'b000; #10;
        A = 4'd7; B = 4'd2; opcode = 3'b000; #10;

        // SUB
        A = 4'd5; B = 4'd3; opcode = 3'b001; #10;

        // AND
        A = 4'b1100; B = 4'b1010; opcode = 3'b010; #10;

        // OR
        A = 4'b1100; B = 4'b1010; opcode = 3'b011; #10;

        // XOR
        A = 4'b1100; B = 4'b1010; opcode = 3'b100; #10;

        // SHIFT
        A = 4'b0101; opcode = 3'b101; #10;

        // ARITH SHIFT
        A = 4'b1000; opcode = 3'b111; #10;

        $finish;
    end

endmodule
