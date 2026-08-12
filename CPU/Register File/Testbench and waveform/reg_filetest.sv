module register_file_tb;

    localparam N = 8;
    localparam NUM_REGS = 8;
    localparam ADDR_WIDTH = 3;

    logic clk;
    logic rst;

    logic write_enable;
    logic [ADDR_WIDTH-1:0] write_address;
    logic [N-1:0] write_data;

    logic [ADDR_WIDTH-1:0] read_address1;
    logic [ADDR_WIDTH-1:0] read_address2;

    logic [N-1:0] read_data1;
    logic [N-1:0] read_data2;

    // DUT
    register_file #(
        .N(N),
        .NUM_REGS(NUM_REGS),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (

        .clk(clk),
        .rst(rst),
        .write_enable(write_enable),
        .write_address(write_address),
        .write_data(write_data),
        .read_address1(read_address1),
        .read_address2(read_address2),
        .read_data1(read_data1),
        .read_data2(read_data2)

    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Waveform
    initial begin
        $dumpfile("register_file.vcd");
        $dumpvars(0, register_file_tb);
    end

    // Test
    initial begin

        rst = 1;
        write_enable = 0;
        write_address = 0;
        write_data = 0;
        read_address1 = 0;
        read_address2 = 0;

        @(posedge clk);
        rst = 0;

        // Write 2 into R1
        write_enable = 1;
        write_address = 3'd1;
        write_data = 8'd2;
        @(posedge clk);

        // Write 5 into R2
        write_address = 3'd2;
        write_data = 8'd5;
        @(posedge clk);

        // Read R1 and R2
        write_enable = 0;
        read_address1 = 3'd1;
        read_address2 = 3'd2;
        #1;

        // Store R1+R2 into R0
        write_enable = 1;
        write_address = 3'd0;
        write_data = read_data1 + read_data2;
        @(posedge clk);

        // Read R0
        write_enable = 0;
        read_address1 = 3'd0;
        #1;

        $display("-----------------------------------");
        $display("R1 = %0d", dut.reg_out[1]);
        $display("R2 = %0d", dut.reg_out[2]);
        $display("R0 = %0d", dut.reg_out[0]);
        $display("-----------------------------------");

        #20;
        $finish;

    end

endmodule
