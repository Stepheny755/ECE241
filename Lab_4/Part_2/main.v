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

	part2 p2(
			.SW(SW[9:0]),
			.KEY(KEY[3:0]),
			.LEDR(LEDR[9:0]),
			.HEX0(HEX0[6:0]),
			.HEX1(HEX1[6:0]),
			.HEX2(HEX2[6:0]),
			.HEX3(HEX3[6:0]),
			.HEX4(HEX4[6:0]),
			.HEX5(HEX5[6:0])
			);
endmodule

module part2(SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input[9:0] SW;
	input[3:0] KEY;
	output[9:0] LEDR;
	output[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

	wire[7:0] register,aluout;

  ALU alu1(SW[3:0],register[3:0],KEY[3:1],aluout);
	REG reg1(aluout,KEY[0],SW[9],register);

	assign LEDR = register;

	hexdecoder h0(SW[3:0],HEX0);
	hexdecoder h1(4'b0,HEX1);
	hexdecoder h2(4'b0,HEX2);
	hexdecoder h3(4'b0,HEX3);
	hexdecoder h4(register[3:0],HEX4);
	hexdecoder h5(register[7:4],HEX5);
	//assign HEX4 = register[3:0];
	//assign HEX5 = register[7:4];
endmodule
