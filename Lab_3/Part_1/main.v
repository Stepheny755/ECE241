`timescale 1ns / 1ns
`default_nettype none

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
			.SW(SW[9:0]),
			.LEDR(LEDR[0])
			);
endmodule

module part1(SW,LEDR);
  input[9:0] SW;
  output LEDR;
  mux7to1 m(SW[6:0],SW[9:7],LEDR);
endmodule

module mux7to1(input[6:0] x,input[2:0] s, output reg f);

	always@(*)
	begin
		case(s)
			3'b000: f = x[0];
			3'b001: f = x[1];
			3'b010: f = x[2];
			3'b011: f = x[3];
			3'b100: f = x[4];
			3'b101: f = x[5];
			3'b110: f = x[6];
			default: f = 0;
		endcase
	end
endmodule
