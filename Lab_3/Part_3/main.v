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

	part3 p3(
			.SW(SW[9:0]),
			.KEY(KEY[2:0]),
			.LEDR(LEDR[9:0]),
			.HEX0(HEX0[6:0]),
			.HEX1(HEX1[6:0]),
			.HEX2(HEX2[6:0]),
			.HEX3(HEX3[6:0]),
			.HEX4(HEX4[6:0]),
			.HEX5(HEX5[6:0])
			);
endmodule

module part3 (SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input[9:0] SW;
	input[2:0] KEY;
	output[9:0] LEDR;
	output[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

	wire[7:0] aluout;
	wire[3:0] aluout1,aluout2;
  ALU alu(SW[7:4],SW[3:0],~KEY[2:0],aluout);

	assign LEDR = aluout;

	hexdecoder h0(SW[3:0],HEX0);
	hexdecoder h1(3'b0,HEX1);
	hexdecoder h2(SW[7:4],HEX2);
	hexdecoder h3(3'b0,HEX3);
	hexdecoder h4(aluout[7:4],HEX5);
	hexdecoder h5(aluout[3:0],HEX4);
endmodule

module ALU(input[3:0] A,B,input[2:0] f,output reg[7:0] aluout);
	wire[3:0] add;
	wire cout;
	RCA_4bit rca(A,B,1'b0,add,cout);

	always@(*)
	begin
		case(f)
			3'b000: aluout = {3'b0,cout,add};
			3'b001: aluout = A+B;
			3'b010: aluout = {4' b0,B}; //look up sign extension
			3'b011: aluout = A||B; //|({A,B});
			3'b100: aluout = &({A,B});
			3'b101: aluout = {A,B};
			default: aluout = 7'b0;
		endcase
	end
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

module hexdecoder(input[3:0] in,output[6:0] out);
	seg0 s0(in[3],in[2],in[1],in[0],out[0]);
	seg1 s1(in[3],in[2],in[1],in[0],out[1]);
	seg2 s2(in[3],in[2],in[1],in[0],out[2]);
	seg3 s3(in[3],in[2],in[1],in[0],out[3]);
	seg4 s4(in[3],in[2],in[1],in[0],out[4]);
	seg5 s5(in[3],in[2],in[1],in[0],out[5]);
	seg6 s6(in[3],in[2],in[1],in[0],out[6]);
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
