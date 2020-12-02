module hexencoder(input[3:0] i, output reg[6:0] hex);
	always@(*) begin
		case(i)
			4'b0000: hex = 7'b1111110;
			4'b0001: hex = 7'b0110000;
			4'b0010: hex = 7'b1101101;
			4'b0011: hex = 7'b1111001;
			4'b0100: hex = 7'b0110011;
			4'b0101: hex = 7'b1011011;
			4'b0110: hex = 7'b1011111;
			4'b0111: hex = 7'b1110000;
			4'b1000: hex = 7'b1111111;
			default: hex = 7'b1111111;
		endcase
		hex = ~hex;
	end
endmodule
