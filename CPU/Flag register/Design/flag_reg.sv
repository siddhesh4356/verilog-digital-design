// Module to implement a 4-bit Flag Register
module flag_reg (
    input  logic clk,rst,en,

    input  logic [3:0] alu_result,
    input  logic  alu_carry, alu_overflow,
    output logic  sign,zero,carry,overflow
);

always_ff @(posedge clk) begin

    if (rst) begin
        sign     <= 1'b0;
        zero     <= 1'b0;
        carry    <= 1'b0;
        overflow <= 1'b0;
    end

    else if (en) begin
        sign     <= alu_result[3];
        zero     <= (alu_result == 4'b0000);
        carry    <= alu_carry;
        overflow <= alu_overflow;
    end

end

endmodule
