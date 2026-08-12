module mod_n_counter #(
    parameter N = 10,
    parameter WIDTH = 4
)(
    input logic clk,
    input logic rst,
    output logic [WIDTH-1:0] count
);

initial begin
    if ((2**WIDTH) < N) begin
        $display("ERROR: WIDTH is too small for MOD-%0d Counter!", N);
        $finish;
    end
end

always_ff @(posedge clk) begin
    if (rst)
        count <= '0;
    else if (count == N-1)
        count <= '0;
    else
        count <= count + 1;
end

endmodule
