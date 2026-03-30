module counter (
	input logic clk,
	input logic en,
	input logic rst,
	output logic [7:0] q
);
	always_ff @ (posedge clk) begin
		if (rst)
			q <= 8'b0;
		else if (en)
			q <= q + 1;
	end

endmodule