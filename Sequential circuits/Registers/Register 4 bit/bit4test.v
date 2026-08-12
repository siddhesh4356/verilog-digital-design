

module register;

    logic clk;
    logic rst;
    logic [3:0]Din;
    logic [3:0] q;

    // DUT
    para4bit uut(
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
        $dumpfile("register.vcd");
        $dumpvars(0, register);
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
        Din = 4'b0000;

        // Reset
        #10;
        rst = 0;

        // Shift in 1
        Din = 4'b1001;
        #10;

        // Shift in 0
        Din = 4'b1101;
        #10;

        // Shift in 1
        Din = 4'b1110;
        #10;

        // Shift in 1
        Din = 4'b1111;
        #10;

        $finish;

    end

endmodule
