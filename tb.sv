`timescale 1ns / 1ps

module tb ();

logic clk;
logic reset;
logic d;
logic q;

// Instantiate the DUT (Device Under Test)
counter dut (
    .clk(clk),
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
    reset = 1;
    d = 0;

    #20;
    reset = 0;

    // Test 1
    d = 1;
    #20;

    // Test 2
    d = 0;
    #20;

    // Test 3
    d = 1;
    #20;

    // Test reset again
    reset = 1;
    #10;
    reset = 0;

    d = 0;
    #20;

    $display("Test completed");
    $finish;

end

/////////////////////////////////////////////////
// Monitor signals
/////////////////////////////////////////////////

initial begin
    $monitor("time=%0t clk=%b reset=%b d=%b q=%b",
              $time, clk, reset, d, q);
end

endmodule
