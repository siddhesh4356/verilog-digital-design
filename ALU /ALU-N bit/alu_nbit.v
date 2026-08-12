module alu_nbit #(parameter N = 4)(
    input  [N-1:0] A,
    input  [N-1:0] B,
    input  [2:0] opcode,
    output reg [N-1:0] Result,
    output reg Z, S, C, V   //V-Overflow logic
);

    // Temporary wires to tackle carries/borrows while computing
    wire [N:0] temp_add;
    wire [N:0] temp_sub;

    wire [N-1:0] add_out, sub_out, and_out, or_out, xor_out;
    wire [N-1:0] left_shift, right_shift, ar_shift;

    // Arithmetic (temp used to tackle carry first here and then stored in add_out)
    assign temp_add = A + B;
    assign temp_sub = A - B;

    assign add_out = temp_add[N-1:0];
    assign sub_out = temp_sub[N-1:0];

    assign and_out = A & B;
    assign or_out  = A | B;
    assign xor_out = A ^ B;

    // Shifts by 1 bit
    assign left_shift  = A << 1;
    assign right_shift  = A >> 1;
    assign ar_shift = $signed(A) >>> 1;

    always @(*) begin
        // default flags
        C = 0;
        V = 0;

        case(opcode)
            3'b000: begin // ADD
                Result = add_out;
                C = temp_add[N];
                V = (A[N-1] == B[N-1]) && (Result[N-1] != A[N-1]);
            end

            3'b001: begin // SUB
                Result = sub_out;
                C = temp_sub[N]; // borrow
                V = (A[N-1] != B[N-1]) && (Result[N-1] != A[N-1]);
            end

            3'b010: Result = and_out;
            3'b011: Result = or_out;
            3'b100: Result = xor_out;
            3'b101: Result = left_shift;
            3'b110: Result = right_shift;
            3'b111: Result = ar_shift;

            default: Result = 0;
        endcase
        Z = (Result == 0);
        S = Result[N-1];  //Sign depends on MSB given by N-1
    end

endmodule
