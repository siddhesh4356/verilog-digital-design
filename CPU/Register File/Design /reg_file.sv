// To design an N-byte Register File
// Current configuration: 8 registers, each N bits wide

module register_file #(
    parameter N = 8,
    parameter NUM_REGS = 8,
    parameter ADDR_WIDTH = 3
)(
    input  logic clk,
    input  logic rst,

    // Write Port
    input  logic write_enable,
    input  logic [ADDR_WIDTH-1:0] write_address,
    input  logic [N-1:0] write_data,

    // Read Ports
    input  logic [ADDR_WIDTH-1:0] read_address1,
    input  logic [ADDR_WIDTH-1:0] read_address2,

    output logic [N-1:0] read_data1,
    output logic [N-1:0] read_data2
);

    // Outputs from all registers
    logic [N-1:0] reg_out [0:NUM_REGS-1];

    // Individual load signals
    logic [NUM_REGS-1:0] load;

    // Decoder
    always_comb begin
        load = '0;

        if (write_enable)
            load[write_address] = 1'b1;
    end

    // Instantiate Registers
    generate
        genvar i;
        for(i = 0; i < NUM_REGS; i++) begin : REG_ARRAY

            enable_nbit #(
                .N(N)
            ) REG (

                .clk(clk),
                .rst(rst),
                .en(load[i]),
                .Din(write_data),
                .q(reg_out[i])

            );

        end
    endgenerate

    // Read Ports
    assign read_data1 = reg_out[read_address1];
    assign read_data2 = reg_out[read_address2];

endmodule
