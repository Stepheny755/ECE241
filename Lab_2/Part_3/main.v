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

	hexdecoder hd(
		.c(SW[3:0]),
		.hex(HEX0)
	);
endmodule

module hexdecoder(input[3:0] c,output[6:0] hex);
	seg0 s0(c[3],c[2],c[1],c[0],hex[0]);
	seg1 s1(c[3],c[2],c[1],c[0],hex[1]);
	seg2 s2(c[3],c[2],c[1],c[0],hex[2]);
	seg3 s3(c[3],c[2],c[1],c[0],hex[3]);
	seg4 s4(c[3],c[2],c[1],c[0],hex[4]);
	seg5 s5(c[3],c[2],c[1],c[0],hex[5]);
	seg6 s6(c[3],c[2],c[1],c[0],hex[6]);
endmodule

module seg0(input c0,c1,c2,c3,output s);
  assign s = ~(~c1&~c3|c3&~c0&c1|c2&~c0|c1&c2|c0&~c3|c0&~c1&~c2);
endmodule

module seg1(input c0,c1,c2,c3,output s);
  assign s = ~(~c0&~c1|~c1&~c3|~c0&c2&c3|~c0&~c2&~c3|c0&~c2&c3);
endmodule

module seg2(input c0,c1,c2,c3,output s);
  assign s = ~(~c0&~c2|~c0&c3|~c2&c3|~c0&c1|c0&~c1);
endmodule

module seg3(input c0,c1,c2,c3,output s);
  assign s = ~(~c0&~c1&~c3|~c0&~c1&c2|c1&~c2&c3|c1&c2&~c3|c0&~c2|c0&~c1&c3);
endmodule

module seg4(input c0,c1,c2,c3,output s);
  assign s = ~((c1|c2|~c3)&(c0|~c3)&(c0|~c1|c2));
endmodule

module seg5(input c0,c1,c2,c3,output s);
  assign s = ~(~c2&~c3|~c0&c1&~c2|c0&~c1|c0&c2|c1&c2&~c3);
endmodule

module seg6(input c0,c1,c2,c3,output s);
  assign s = ~(~c0&c1&~c2|~c0&~c1&c2|c2&~c3|c0&~c1|c0&c3|c0&c2);
endmodule
