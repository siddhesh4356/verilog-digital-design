// Testbench for Flag Register
module test;

logic clk;
logic rst;
logic en;

logic [3:0] alu_result;
logic alu_carry;
logic alu_overflow;

logic sign;
logic zero;
logic carry;
logic overflow;

flag_reg uut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .alu_result(alu_result),
    .alu_carry(alu_carry),
    .alu_overflow(alu_overflow),
    .sign(sign),
    .zero(zero),
    .carry(carry),
    .overflow(overflow)
);

// Clock Generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Waveform Dump
initial begin
    $dumpfile("flag_reg.vcd");
    $dumpvars(0, test);
end

// Monitor
initial begin
    $monitor("Time=%0t | rst=%b | en=%b | alu_result=%b | S=%b | Z=%b | C=%b | V=%b",
             $time, rst, en, alu_result,
             sign, zero, carry, overflow);
end

// Test Stimulus
initial begin

    // Initialize
    rst = 1;
    en = 0;
    alu_result = 4'b0000;
    alu_carry = 0;
    alu_overflow = 0;

    // Reset
    #10;
    rst = 0;

    // Test Case 1: Result = 0
    en = 1;
    alu_result = 4'b0000;
    #10;

    // Test Case 2: 7 + 1 = 1000 (-8)
    alu_result = 4'b1000;
    #10;

    $finish;
end

endmodule
