module tb_sr_latch;

logic S, R;
logic Q;

sr_latch uut (
    .S(S),
    .R(R),
    .Q(Q)
);

initial begin
    $dumpfile("sr_latch.vcd");
    $dumpvars(0, tb_sr_latch);

    S = 0; R = 0; #10; // Hold
    S = 1; R = 0; #10; // Set
    S = 0; R = 0; #10; // Hold
    S = 0; R = 1; #10; // Reset
    S = 0; R = 0; #10; // Hold
    S = 1; R = 1; #10; // Invalid

    $finish;
end

endmodule
