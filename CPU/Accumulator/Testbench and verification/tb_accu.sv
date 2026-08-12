module testbench;

parameter N = 4;

logic clk;
logic rst;
logic accu_load;
logic [N-1:0] alu_result;
logic [N-1:0] accu_out;

// DUT (Device Under Test)
acc_reg #(.N(N)) uut (
    .clk(clk),
    .rst(rst),
    .accu_load(accu_load),
    .alu_result(alu_result),
    .accu_out(accu_out)
);

// Clock Generation (10 ns period)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Waveform Dump
initial begin
    $dumpfile("acc_reg.vcd");
    $dumpvars(0, testbench);
end

// Monitor
initial begin
    $monitor("Time=%0t | rst=%b | accu_load=%b | alu_result=%b | accu_out=%b",
              $time, rst, accu_load, alu_result, accu_out);
end

// Test Stimulus
initial begin

    // Initialize
    rst = 1;
    accu_load = 0;
    alu_result = 4'b0000;

    // Apply Reset
    #10;
    rst = 0;

    // Load First ALU Result
    accu_load = 1;
    alu_result = 4'b1001;
    #10;

    // Load Second ALU Result
    alu_result = 4'b1101;
    #10;

    // Disable Loading (Should Hold Previous Value)
    accu_load = 0;
    alu_result = 4'b1111;
    #10;

    // Enable Loading Again (Should Load 1111)
    accu_load = 1;
    #10;

    $finish;

end

endmodule
