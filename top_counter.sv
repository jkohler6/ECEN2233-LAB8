module top_counter (
	input logic sysclk,
	input logic [7:0] sw,
	input logic [3:0] btn,
	output logic [3:0] sseg_an,
	output logic [7:0] ssegout,
	output logic [7:0] led
);
	logic divd_clk;
	logic debounce_clk;
	logic rst_btn;
	logic en_btn;

	clock_divider clk_div(
		.clk(sysclk),
		.div_clk(divd_clk),
		.debounce_clk(debounce_clk)
	);
	
	debounce dbnc1(
		.clk(debounce_clk),
		.button_in(btn[2]),
		.button_clean(rst_btn)
	);


	debounce dbnc2(
		.clk(debounce_clk),
		.button_in(btn[3]),
		.button_clean(en_btn)
	);
	
	counter coun(
		.clk(divd_clk),
		.en(en_btn),
		.rst(rst_btn),
		.q(led)
	);

endmodule
