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
			.KEY(~KEY[3:0]),
			.LEDR(LEDR[9:0])
      );
endmodule

module part3(input[9:0] SW,input[3:0] KEY,output[9:0] LEDR);
  rotating_reg_8bit rr8bit(KEY[0],SW[9],KEY[1],KEY[2],KEY[3],SW[7:0],LEDR[7:0]);
endmodule

module rotating_reg_8bit(input clk,reset,parallelLoadn,RotateRight,ASRight,input[7:0] Data_In,output[7:0] Q);
	//add another mux here for ASRight
	wire data_left;
	mux2to1 m1(.x(Q[7]),.y(Q[0]),.s(ASRight),.f(data_left));
  rotating_reg r1(.r(Q[7]),.l(Q[1]),.loadleft(RotateRight),.D(Data_In[0]),.loadn(parallelLoadn),.clk(clk),.reset(reset),.q(Q[0]));
  rotating_reg r2(.r(Q[0]),.l(Q[2]),.loadleft(RotateRight),.D(Data_In[1]),.loadn(parallelLoadn),.clk(clk),.reset(reset),.q(Q[1]));
  rotating_reg r3(.r(Q[1]),.l(Q[3]),.loadleft(RotateRight),.D(Data_In[2]),.loadn(parallelLoadn),.clk(clk),.reset(reset),.q(Q[2]));
  rotating_reg r4(.r(Q[2]),.l(Q[4]),.loadleft(RotateRight),.D(Data_In[3]),.loadn(parallelLoadn),.clk(clk),.reset(reset),.q(Q[3]));
  rotating_reg r5(.r(Q[3]),.l(Q[5]),.loadleft(RotateRight),.D(Data_In[4]),.loadn(parallelLoadn),.clk(clk),.reset(reset),.q(Q[4]));
  rotating_reg r6(.r(Q[4]),.l(Q[6]),.loadleft(RotateRight),.D(Data_In[5]),.loadn(parallelLoadn),.clk(clk),.reset(reset),.q(Q[5]));
  rotating_reg r7(.r(Q[5]),.l(Q[7]),.loadleft(RotateRight),.D(Data_In[6]),.loadn(parallelLoadn),.clk(clk),.reset(reset),.q(Q[6]));
  rotating_reg r8(.r(Q[6]),.l(data_left),.loadleft(RotateRight),.D(Data_In[7]),.loadn(parallelLoadn),.clk(clk),.reset(reset),.q(Q[7]));
endmodule

module rotating_reg(input r, l, loadleft, D, loadn, clk, reset, output q);
  wire w1,w2;
  mux2to1 m1(.x(l),.y(r),.s(loadleft),.f(w1));
  mux2to1 m2(.x(w1),.y(D),.s(loadn),.f(w2));
  flipflop dff(.d(w2),.clk(clk),.reset(reset),.q(q));
endmodule
