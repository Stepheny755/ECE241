module t_ff(input clk, t, reset, output reg q);
  always@(posedge clk,negedge reset)
    begin
      if(!reset)
        q <= 0;
      else
        if(t)
          q <= ~q;
        else
          q <= q;
    end
endmodule
