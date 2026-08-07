module testbench;

    parameter N = 4;

    logic clk;
    logic rst;
    logic inst_load;
    logic [N-1:0] inst_in;
    logic [N-1:0] inst_out;

    // DUT Device under test
    inst_reg #(.N(N)) dut (
        .clk(clk),
        .rst(rst),
        .inst_load(inst_load),
        .inst_in(inst_in),
        .inst_out(inst_out)
    );

    // Clock Generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Waveform Dump
    initial begin
        $dumpfile("inst_reg.vcd");
        $dumpvars(0, testbench);
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | rst=%b | inst_load=%b | inst_in=%b | inst_out=%b",
                  $time, rst, inst_load, inst_in, inst_out);
    end

    // Test Stimulus
    initial begin

        // Initialize
        rst = 1;
        en  = 0;
        Din = 4'b0000;

        // Apply reset
        #10;
        rst = 0;

        // Load first value
        en  = 1;
        Din = 4'b1001;
        #10;

        // Load second value
        Din = 4'b1101;
        #10;

        // Disable register (should HOLD previous value)
        en  = 0;
        Din = 4'b1111;
        #10;

        // Enable again (should now load 1111)
        en  = 1;
        #10;

        $finish;

    end

endmodule
