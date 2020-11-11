module shift_reg_16bit(input w,clk,reset,loadn,enable,input[15:0] d,output reg[15:0] q);
  always@(posedge clk,negedge reset)
		begin
      if(!reset)
        q<=0;
      else if(loadn)
        q<=d;
      else if(enable)
        begin
          q <= {q[14:0],w};
        end
      else
        q<=q;
		end
endmodule
