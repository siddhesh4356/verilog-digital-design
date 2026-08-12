//Test-bench to test Program counter
module test;

parameter N = 4;

logic clk,rst,prg_inc,pc_load;
logic [N-1:0] pc_in;
logic [N-1:0] prg_count;

prg_counter #(.N(N)) uut (
    .clk(clk),
    .rst(rst),
    .prg_inc(prg_inc),
    .pc_load(pc_load),
    .pc_in(pc_in),
    .prg_count(prg_count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("prg_counter.vcd");
    $dumpvars(0, test_prg_counter);
end

initial begin
    $monitor("Time=%0t | rst=%b | prg_inc=%b | pc_load=%b | pc_in=%b | prg_count=%b",
              $time, rst, prg_inc, pc_load, pc_in, prg_count);
end

initial begin

    rst = 1;
    prg_inc = 0;
    pc_load = 0;
    pc_in = 4'b0000;

    #10;
    rst = 0;

    prg_inc = 1;
    #40;

    prg_inc = 0;
    pc_load = 1;
    pc_in = 4'b1010;
    #10;

    pc_load = 0;
    prg_inc = 1;
    #30;

    $finish;

end

endmodule
