`timescale 1ns / 1ps

module tb ();

logic clk;
logic en;
logic rst;
logic [7:0] q;

// Instantiate the DUT (Device Under Test)
counter dut (
    .clk(clk),
    .en(en),
    .rst(rst),
    .q(q)
);

/////////////////////////////////////////////////
// Clock generation (10 ns period → 100 MHz)
/////////////////////////////////////////////////

initial clk = 0;
always #5 clk = ~clk;

/////////////////////////////////////////////////
// Test sequence
/////////////////////////////////////////////////

initial begin

    $display("Starting DFF Testbench");
    
    // initial values
    rst = 1;
    en = 0;

    #20;
    rst = 0;

    // Test 1
    en = 1;
    #20;

    // Test 2
    en = 0;
    #20;

    // Test 3
    en = 1;
    #20;

    // Test reset again
    rst = 1;
    #10;
    rst = 0;

    en = 0;
    #20;

    $display("Test completed");
    $finish;

end

/////////////////////////////////////////////////
// Monitor signals
/////////////////////////////////////////////////

initial begin
    $monitor("time=%0t clk=%b reset=%b d=%b q=%b",
              $time, clk, rst, en, q);
end

endmodule
