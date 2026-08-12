module mod_n_counter_tb;

    localparam N = 10;
    localparam WIDTH = 4;

    logic clk;
    logic rst;
    logic [WIDTH-1:0] count;

    // DUT
    mod_n_counter #(
        .N(N),
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Dump Waveform
    initial begin
        $dumpfile("mod_ncounters.vcd");
        $dumpvars(0, mod_n_counter_tb);
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | rst=%b | count=%0d",
                 $time, rst, count);
    end

    // Test Sequence
    initial begin
        rst = 1;

        #10;
        rst = 0;

        // Let counter run
        #250;

        // Apply reset again
        rst = 1;
        #10;
        rst = 0;

        #50;

        $finish;
    end

endmodule
