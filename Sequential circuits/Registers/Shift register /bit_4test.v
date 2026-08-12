

module shift_register_tb;

    logic clk;
    logic rst;
    logic Din;
    logic [3:0] q;

    // DUT
    bit_4shift uut(
        .clk(clk),
        .rst(rst),
        .Din(Din),
        .q(q)
    );

    // Clock Generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Waveform Dump
    initial begin
        $dumpfile("shift_register.vcd");
        $dumpvars(0, shift_register_tb);
    end

    // Monitor Output
    initial begin
        $monitor("Time=%0t | rst=%b | Din=%b | q=%b",
                  $time, rst, Din, q);
    end

    // Test Stimulus
    initial begin

        // Initialize
        rst = 1;
        Din = 0;

        // Reset
        #10;
        rst = 0;

        // Shift in 1
        Din = 1;
        #10;

        // Shift in 0
        Din = 0;
        #10;

        // Shift in 1
        Din = 1;
        #10;

        // Shift in 1
        Din = 1;
        #10;

        // Shift in 0
        Din = 0;
        #10;

        // Shift in 1
        Din = 1;
        #10;

        $finish;

    end

endmodule
