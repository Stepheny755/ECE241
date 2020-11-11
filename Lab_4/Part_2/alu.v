module ALU(input[3:0] A,B,input[2:0] f,output reg[7:0] aluout);
	wire[3:0] add;
	wire cout;
	RCA_4bit rca(A,B,1'b0,add,cout);

	always@(*)
	begin
		case(f)
			3'b000: aluout = {3'b0,cout,add};
			3'b001: aluout = A+B;
			3'b010: aluout = {B[3],B[3],B[3],B[3],B};
			3'b011: aluout = |({A,B});
			3'b100: aluout = &({A,B});
			3'b101: aluout = A<<B;
      3'b110: aluout = A*B;
			3'b111: aluout = B;
			default: aluout = 7'b0;
		endcase
	end
endmodule
