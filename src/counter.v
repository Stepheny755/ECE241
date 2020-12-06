module upcounter_4bit(input clk,reset,enable,output reg[3:0] Q);
  always@(negedge resetn,posedge clk)
    if(!resetn)
      Q<=0;
    else if(enable)
      Q<=Q+1;
endmodule

module modpulsehalfm(input clock_50,reset,output pulsehalfm);
  wire[3:0] w1;
  upcounter_4bit u4b(clock_50,reset,1'b1,w1);
  always@(*)
    if(w1==4'b1001)
      pulsehalfm = 1'b1;
    else
      pulsehalfm = 1'b0;
endmodule
