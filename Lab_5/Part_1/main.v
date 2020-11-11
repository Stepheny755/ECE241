`timescale 1ns / 1ns

module main	(
	input wire CLOCK_50,            //On Board 50 MHz
	input wire [9:0] SW,            // On board Switches
	input wire [3:0] KEY,           // On board push buttons
	output wire [6:0] HEX0,         // HEX displays
	output wire [6:0] HEX1,
	output wire [6:0] HEX2,
	output wire [6:0] HEX3,
	output wire [6:0] HEX4,
	output wire [6:0] HEX5,
	output wire [9:0] LEDR,         // LEDs
	output wire [7:0] x,            // VGA pixel coordinates
	output wire [6:0] y,
	output wire [2:0] colour,       // VGA pixel colour (0-7)
	output wire plot,               // Pixel drawn when this is pulsed
	output wire vga_resetn          // VGA resets to black when this is pulsed (NOT CURRENTLY AVAILABLE)
);

	part1 p1(
			.SW(SW[1:0]),
			.KEY(KEY[3]),
			.HEX0(HEX0),
			.HEX1(HEX1)
      );
endmodule

module part1(SW, KEY, HEX0, HEX1);
	input[1:0] SW;//SW[0] is enable, SW[1] is clear
	input KEY;
	output[6:0] HEX0,HEX1;

	wire[7:0] Q;

	t_ff tff1(KEY,SW[0],SW[1],Q[0]);
	t_ff tff2(KEY,(SW[0]&Q[0]),SW[1],Q[1]);
	t_ff tff3(KEY,(SW[0]&Q[0]&Q[1]),SW[1],Q[2]);
	t_ff tff4(KEY,(SW[0]&Q[0]&Q[1]&Q[2]),SW[1],Q[3]);
	t_ff tff5(KEY,(SW[0]&Q[0]&Q[1]&Q[2]&Q[3]),SW[1],Q[4]);
	t_ff tff6(KEY,(SW[0]&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]),SW[1],Q[5]);
	t_ff tff7(KEY,(SW[0]&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]),SW[1],Q[6]);
	t_ff tff8(KEY,(SW[0]&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]),SW[1],Q[7]);

	hexdecoder hex0(Q[3:0],HEX0);
	hexdecoder hex1(Q[7:4],HEX1);
endmodule
