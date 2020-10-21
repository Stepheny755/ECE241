
module FA(input a,b,cin,output s,cout);
	assign s = cin^a^b;
	assign cout = cin&a|cin&b|a&b;
endmodule

module FA(input a,b,cin,output s,cout);
  always@(*) begin
    s = cin^a^b;
    cout = cin&a|cin&b|a&b;
  end
endmodule

module FA(input a,b,cin,output s,cout);
  always@(*) begin
    if(cin^a^b)
      s = 1;
    else
      s = 0;
  end
  always@(*) begin
    if(cin&a|cin&b|a&b)
      cout=1;
    else
      cout=0;
  end
endmodule
