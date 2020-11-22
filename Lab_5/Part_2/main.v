`timescale 1ns / 1ns

module part2(SW, CLOCK_50, HEX0);
	input[9:0] SW;
  input CLOCK_50;
	output[6:0] HEX0;

	wire[3:0] Q;
  reg enable;
  reg[28:0] RateDivider;
  reg[28:0] def;
  
  always@(posedge CLOCK_50)
    begin
      if(SW[1:0]==2'b00)
        def = 1'd0;
      else if(SW[1:0]==2'b01)
        def = (50E6)-1;
      else if(SW[1:0]==2'b10)
        def = (100E6)-1;
      else if(SW[1:0]==2'b11)
        def = (200E6)-1;
      else
        def = 1'd0;

      RateDivider<=RateDivider-1;
      enable <= (RateDivider == 4'b0000)?1:0;
      if(RateDivider==0)
        RateDivider<=def;
      else if(!SW[9])
        begin
          RateDivider<=def;
          enable<=0;
        end
    end

  //assign enable = (RateDivider == 4'b0000)?1:0;

  counter_8bit c1(CLOCK_50,SW[9],enable,Q);

	hexdecoder hex0(Q,HEX0);

endmodule
