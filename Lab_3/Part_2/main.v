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
			.LEDR(LEDR[9:0])
			);
endmodule

module part2(SW,LEDR);
	input[9:0] SW;
	output[9:0] LEDR;
  RCA_4bit rca(SW[7:4],SW[3:0],SW[8],LEDR[3:0],LEDR[9]);
endmodule

module RCA_4bit(input[3:0] a,b,input cin,output[3:0] s,output cout);
	wire c1,c2,c3;
	FA fa1(a[0],b[0],cin,s[0],c1);
	FA fa2(a[1],b[1],c1,s[1],c2);
	FA fa3(a[2],b[2],c2,s[2],c3);
	FA fa4(a[3],b[3],c3,s[3],cout);
endmodule

module FA(input a,b,cin,output s,cout);
	assign s = a^b^cin;
	assign cout = (a&b)|(cin&a)|(cin&b);
endmodule

module hexdecoder(input[3:0] SW,output[6:0] HEX0);
	seg0 s0(SW[3],SW[2],SW[1],SW[0],HEX0[0]);
	seg1 s1(SW[3],SW[2],SW[1],SW[0],HEX0[1]);
	seg2 s2(SW[3],SW[2],SW[1],SW[0],HEX0[2]);
	seg3 s3(SW[3],SW[2],SW[1],SW[0],HEX0[3]);
	seg4 s4(SW[3],SW[2],SW[1],SW[0],HEX0[4]);
	seg5 s5(SW[3],SW[2],SW[1],SW[0],HEX0[5]);
	seg6 s6(SW[3],SW[2],SW[1],SW[0],HEX0[6]);
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