`timescale 1ns / 1ns

module part1(SW,LEDR);
  input SW[9:0];
  output LEDR;
  mux7to1 m(SW[6:0],SW[9:7],LEDR);
endmodule

module mux7to1(input[6:0] x,[2:0] s, output reg f);

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
