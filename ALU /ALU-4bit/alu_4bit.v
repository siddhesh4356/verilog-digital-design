module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [1:0] opcode,
    output reg [3:0] Result,
    output reg C,   // Carry/Borrow
    output reg Z,   // Zero
    output reg S,   // Sign
    output reg V    // Overflow
);

    // Internal wires
    wire [4:0] add_temp; // 5-bit to capture carry
    wire [4:0] sub_temp;

    wire [3:0] add_out, sub_out, and_out, or_out;

    // Computes in parallel
    assign add_temp = A + B;
    assign sub_temp = A - B;

    assign add_out = add_temp[3:0];
    assign sub_out = sub_temp[3:0];
    assign and_out = A & B;
    assign or_out  = A | B;

    always @(*) begin
        // Assigning by default
        Result = 4'b0000;
        C = 0;
        V = 0;

        case(opcode)
            2'b00: begin // ADD
                Result = add_out;
                C = add_temp[4];

                // Overflow detection (signed)
                V = (A[3] == B[3]) && (Result[3] != A[3]);
            end

            2'b01: begin // SUB
                Result = sub_out;
                C = sub_temp[4]; // borrow indication

                // Overflow detection
                V = (A[3] != B[3]) && (Result[3] != A[3]);
            end

            2'b10: begin // AND
                Result = and_out;
                C = 0;
                V = 0;
            end

            2'b11: begin // OR
                Result = or_out;
                C = 0;
                V = 0;
            end
        endcase

        // Common flags
        Z = (Result == 4'b0000);
        S = Result[3];

    end

endmodule
