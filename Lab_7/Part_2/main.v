// Part 2 skeleton

module main
	(
		CLOCK_50,						//	On Board 50 MHz
    SW,
		KEY,							// On Board Keys
		// The ports below are for the VGA output.  Do not change.
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,						//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B   						//	VGA Blue[9:0]
	);

	input			CLOCK_50;				//	50 MHz
	input	[3:0]	KEY;
  input [9:0] SW;

	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[7:0]	VGA_R;   				//	VGA Red[7:0] Changed from 10 to 8-bit DAC
	output	[7:0]	VGA_G;	 				//	VGA Green[7:0]
	output	[7:0]	VGA_B;   				//	VGA Blue[7:0]

	wire resetn;
	assign resetn = KEY[0];

	// Create the colour, x, y and writeEn wires that are inputs to the controller.

	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire writeEn;


	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(writeEn),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "black.mif";

	// Put your code here. Your code should produce signals x,y,colour and writeEn
	// for the VGA controller, in addition to any other functionality your design may require.
  wrapper w(
    .clk(CLOCK_50),
		.resetn(resetn),
		.go(!KEY[3]),//key to take data inputs
		.plot_in(!KEY[1]),
		.black(!KEY[2]),
		.data(SW[6:0]),
    .colour_in(SW[9:7]),
    .xloc(x),
    .yloc(y),
		.colour_out(colour),
		.plot_out(writeEn)
    );

endmodule

module wrapper(
    input clk,
    input resetn,
    input go,
    input plot_in,
		input black,
    input [6:0] data,
    input [2:0] colour_in,
    output[7:0] xloc,
    output[6:0] yloc,
    output[2:0] colour_out,
		output plot_out);

    // lots of wires to connect our datapath and control
    wire ld_rxin, ld_ryin, ld_rxout, ld_ryout, ld_col, selxy;
		wire inc, rinc;
		wire draw_complete;

    control C0(
        .clk(clk),
        .resetn(resetn),
        .go(go),
				.draw_complete(draw_complete),

        .ld_rxin(ld_rxin),
        .ld_ryin(ld_ryin),
        .ld_rxout(ld_rxout),
        .ld_ryout(ld_ryout),
				.ld_col(ld_col),
        .selxy(selxy),
        .inc(inc),
				.reset_inc(rinc),

        .black(black),
        .plot_in(plot_in),
				.plot_out(plot_out)
    );

    datapath D0(
        .clk(clk),
        .resetn(resetn),

        .data(data),
				.colour_in(colour_in),

				.ld_rxin(ld_rxin),
        .ld_ryin(ld_ryin),
        .ld_rxout(ld_rxout),
        .ld_ryout(ld_ryout),
				.ld_col(ld_col),
        .selxy(selxy),
        .inc(inc),
				.reset_inc(rinc),

        .colour_out(colour_out),
        .rxout(xloc),
        .ryout(yloc),
				.draw_complete(draw_complete)
    );
 endmodule
