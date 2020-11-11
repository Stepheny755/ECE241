`timescale 1ns / 1ns

module part3(SW,KEY,LEDR,CLOCK_50);
	input[9:0] SW;
  input CLOCK_50;
	output[9:0] LEDR;

	wire[3:0] Q;
  reg enable;
  reg[28:0] RateDivider;
  reg[28:0] def = (50E6)-1;
  /*
  always@(*)
    begin
      if(SW[1:0]==1'd0)
        def = 1'd0;
      else if(SW[1:0]==1'd1)
        def = 50E6-1;
      else if(SW[1:0]==1'd2)
        def = 100E6-1;
      else if(SW[1:0]==1'd3)
        def = 200E6-1;
      else
        def = 1'd0;
    end
    */
  always@(posedge CLOCK_50)
    begin
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

  counter_8bit c1(CLOCK_50,SW[9],enable,Q);

	hexdecoder hex0(Q,HEX0);

endmodule
