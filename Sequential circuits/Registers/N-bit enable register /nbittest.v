module nregister;

    parameter N = 4;

    logic clk;
    logic rst;
    logic en;
    logic [N-1:0] Din;
    logic [N-1:0] q;

    // DUT Device under test
    enable_nbit #(.N(N)) uut (
        .clk(clk),
        .rst(rst),
        .en(en),
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
        $dumpfile("nregister.vcd");
        $dumpvars(0, nregister);
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | rst=%b | en=%b | Din=%b | q=%b",
                  $time, rst, en, Din, q);
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
