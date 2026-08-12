module counters;
parameter N=4;
logic clk,rst;
logic [N-1:0]q;
logic opcode;

n_ring_johnson #(.N(N)) uut(
   .q(q),
   .clk(clk),
   .rst(rst),
   .opcode(opcode)  
);

initial begin
   clk=0;
   forever #5 clk = ~clk;
    end
    
    initial begin
    $dumpfile("n_ring_johnson.vcd");
    $dumpvars(0,counters);
    
    end
    initial begin
         $monitor("Time=%0t | rst=%b | opcode=%b | q=%b",
              $time, rst, opcode, q);
    end
    
     initial begin

         // Initialize all inputs
    rst = 1;
    opcode = 1'b0;
    
    // Reset
    #10;
    rst = 0;  
        
        opcode = 1'b0;   //Ring counter
        #40;
        rst=1;
        #10;
        rst=0;
        opcode = 1'b1;   //johnson counter
        #80;
        
           $finish;
        end
     
        endmodule
