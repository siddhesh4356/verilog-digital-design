module sr_latch (
    input  logic S,
    input  logic R,
    output logic Q
);

always_latch begin
    if (S && !R)
        Q <= 1'b1;      // Set
    else if (!S && R)
        Q <= 1'b0;      // Reset
    else if (S && R)
        Q <= 1'bx;      // Invalid state
    // else: hold previous value automatically
end

endmodule

