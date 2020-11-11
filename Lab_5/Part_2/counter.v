module counter_8bit(input clk,reset,enable,output reg[3:0] q);
  always@(posedge clk)
    begin
      if(!reset)
        q<=0;
      else if(q==4'b1111)
        q<=0;
      else if(enable)
        q<=q+1;
    end
endmodule
