module testbench;

parameter N = 4;

logic clk;
logic rst;
logic prg_inc;
logic pc_load;
logic [N-1:0] pc_in;
logic [N-1:0] prg_count;

// DUT
prg_counter #(.N(N)) uut (
    .clk(clk),
    .rst(rst),
    .prg_inc(prg_inc),
    .pc_load(pc_load),
    .pc_in(pc_in),
    .prg_count(prg_count)
);

// Clock Generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Dump Waveform
initial begin
    $dumpfile("prg_counter.vcd");
    $dumpvars(0, testbench);
end

// Monitor
initial begin
    $monitor("Time=%0t | rst=%b | pc_load=%b | prg_inc=%b | pc_in=%b | prg_count=%b",
             $time, rst, pc_load, prg_inc, pc_in, prg_count);
end

// Test Stimulus
initial begin

    // Reset
    rst = 1;
    prg_inc = 0;
    pc_load = 0;
    pc_in = 4'b0000;

    #10;
    rst = 0;

    // Load 1011
    pc_load = 1;
    pc_in = 4'b1011;
    #10;

    // Increment once
    pc_load = 0;
    prg_inc = 1;
    #10;

    // Load 1111
    prg_inc = 0;
    pc_load = 1;
    pc_in = 4'b1111;
    #10;

    $finish;

end

endmodule
