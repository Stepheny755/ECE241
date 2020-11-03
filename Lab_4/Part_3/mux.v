module mux2to1(input x, y, s, output f);
  assign f = (s&x)|(~s&y);
endmodule
