module n_universaltest;

parameter N=4;
logic clk,rst;
logic [N-1:0]Din;
logic [N-1:0]q;
logic [1:0]opcode;
logic left_shift,right_shift;

n_universal #(.N(N)) uut(
   .Din(Din),
   .q(q),
   .clk(clk),
   .rst(rst),
   .opcode(opcode),
   .right_shift(right_shift),
   .left_shift(left_shift)
);

initial begin
   clk=0;
   forever #5 clk = ~clk;
    end
    
    initial begin
    $dumpfile("n_universal.vcd");
    $dumpvars(0,n_universaltest);
    
    end
    initial begin
         $monitor("Time=%0t | rst=%b | opcode=%b | Din=%b | LS=%b | RS=%b | q=%b",
              $time, rst, opcode, Din, left_shift, right_shift, q);
    end
    
     initial begin

         // Initialize all inputs
    rst = 1;
    opcode = 2'b00;
    Din = 4'b0000;
    left_shift = 0;
    right_shift = 0;

    // Reset
    #10;
    rst = 0;
        
        Din = 4'b1011;
        opcode = 2'b11;   //Parallel loading
        #10;
        
        right_shift=0;
        opcode = 2'b01;   //right shift
        #10;
        
        left_shift=0;
        opcode = 2'b10;   //left shift
        #10;
        
        opcode = 2'b00;
        #10;
           $finish;
        end
     
        endmodule
