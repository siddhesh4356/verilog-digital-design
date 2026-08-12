module testb_d_latch;

logic D, EN;
logic Q;

d_latch uut (
    .D(D),
    .EN(EN),
    .Q(Q)
);

initial begin
    $dumpfile("d_latch.vcd");
    $dumpvars(0, testb_d_latch);

    // EN=0, Q should hold
    EN = 0; D = 0; #10;

    // Transparent mode, Q follows D
    EN = 1; D = 1; #10;
    EN = 1; D = 0; #10;

    // Hold previous value
    EN = 0; D = 1; #10;

    // Transparent again
    EN = 1; D = 1; #10;

    $finish;
end

endmodule
