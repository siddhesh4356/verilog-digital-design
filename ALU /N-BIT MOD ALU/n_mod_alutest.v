

module test_modular_alu;
    parameter N = 4;
    reg [N-1:0] A;
    reg [N-1:0] B;

    // Main Opcode
    reg [1:0] op_main;

    // Sub-opcodes
    reg  [1:0] op_ar;
    reg [1:0]  op_log;
    reg [1:0]  op_shift;
    wire [N-1:0] Result;
    wire C;
    wire Z;
    wire S;
    wire V;

    // Comparator Outputs
    wire L;
    wire E;
    wire G;

    n_mod_alu #(N) uut (

        .A(A),
        .B(B),

        .op_main(op_main),

        .op_ar(op_ar),
        .op_log(op_log),
        .op_shift(op_shift),

        .Result(Result),

        .C(C),
        .Z(Z),
        .S(S),
        .V(V),

        .L(L),
        .E(E),
        .G(G)

    );

   

    initial begin
       
        // Waveform dump
        $dumpfile("mod_alu.vcd");
        $dumpvars(0, test_modular_alu);
        A=0;
        B=0;
        op_main=0;
        op_ar=0;
        op_shift=0;
        op_log=0;
        #5
        // ARITHMETIC OPERATIONS
     
        // ADD : 5 + 3 = 8
        A = 4'd5;
        B = 4'd3;
        op_main = 2'b00;
        op_ar   = 2'b00;
        #5;

        // SUB : 5 - 3 = 2
        A = 4'd5;
        B = 4'd3;
        op_main = 2'b00;
        op_ar  = 2'b01;
        #5;
        
        //Multiplication
         A = 4'd5;
        B = 4'd3;
        op_main=2'b00;
        op_ar=2'b10;
        #5;
        
        //Division
         A = 4'd5;
        B = 4'd3;
        op_main=2'b00;
        op_ar=2'b11;
        #5;
        // LOGICAL OPERATIONS

        // AND
        A = 4'd5;
        B = 4'd3;

        op_main = 2'b01;
        op_log  = 2'b00;

        #5;

        // OR
        A = 4'd3;
        B = 4'd3;

        op_main = 2'b01;
        op_log  = 2'b01;

        #5;

        // XOR
        A = 4'd5;
        B = 4'd3;

        op_main = 2'b01;
        op_log  = 2'b10;

        #5;

        // SHIFT OPERATIONS

        // LEFT SHIFT
        A = 4'd5;

        op_main  = 2'b10;
        op_shift = 2'b00;

        #5;

        // RIGHT SHIFT
        A = 4'd5;

        op_main  = 2'b10;
        op_shift = 2'b01;

        #5;

        // ARITHMETIC SHIFT
        A = 4'd5;

        op_main  = 2'b10;
        op_shift = 2'b10;

        #5;
        // COMPARATOR OPERATIONS


        A = 4'd9;
        B = 4'd4;

        op_main = 2'b11;

        #5;


        $finish;

    end

endmodule
