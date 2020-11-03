module REG(input[7:0] D,input clk,r,output reg[7:0] Q);
  always@(posedge clk)
    if(r==0)
      Q <= 0;
    else
      Q <= D;
endmodule
