module main(input [9:0] SW,input[3:0] KEY,output wire [6:0] HEX0,HEX2,HEX4,HEX5);
  wire[3:0] data;
  ram32x4 ram(.address(SW[8:4]),.clock(KEY[0]),.data(SW[3:0]),.wren(SW[9]),.q(data));

  hexdecoder hex0(data,HEX0);
  hexdecoder hex2(SW[3:0],HEX2);
  hexdecoder hex4(SW[7:4],HEX4);
  hexdecoder hex5({3'b0,SW[8]},HEX5);
endmodule
