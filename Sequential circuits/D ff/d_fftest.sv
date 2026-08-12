module test;
logic clk,rst,d,q;

d_ff uut(
 .clk(clk),
 .rst(rst),
 .d(d),
 .q(q)
);

always #5 clk= ~clk;

initial begin
  $dumpfile("ff.vcd");
  $dumpvars(0,test);
end

initial begin
  clk=0;
  rst=1;
  d=0;

 #10 rst = 0;
 
#10 d=1;
#10 d=0;
#10 d=1;

#10 rst=1;
#10 rst=0;
#10 d=0;

#20 $finish;
end


initial begin
    $monitor("Time=%0t clk=%b rst=%b d=%b q=%b",
             $time, clk, rst, d, q);
end
endmodule
