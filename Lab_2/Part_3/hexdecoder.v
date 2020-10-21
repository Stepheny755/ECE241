`timescale 1ns / 1ns


module hexdecoder(input[3:0] SW,output[6:0] HEX0);
	seg0 s0(SW[3],SW[2],SW[1],SW[0],HEX0[0]);
	seg1 s1(SW[3],SW[2],SW[1],SW[0],HEX0[1]);
	seg2 s2(SW[3],SW[2],SW[1],SW[0],HEX0[2]);
	seg3 s3(SW[3],SW[2],SW[1],SW[0],HEX0[3]);
	seg4 s4(SW[3],SW[2],SW[1],SW[0],HEX0[4]);
	seg5 s5(SW[3],SW[2],SW[1],SW[0],HEX0[5]);
	seg6 s6(SW[3],SW[2],SW[1],SW[0],HEX0[6]);
endmodule

module seg0(input c0,c1,c2,c3,output s);
  assign s = ~(~c1&~c3|c3&~c0&c1|c2&~c0|c1&c2|c0&~c3|c0&~c1&~c2);
endmodule

module seg1(input c0,c1,c2,c3,output s);
  assign s = ~(~c0&~c1|~c1&~c3|~c0&c2&c3|~c0&~c2&~c3|c0&~c2&c3);
endmodule

module seg2(input c0,c1,c2,c3,output s);
  assign s = ~(~c0&~c2|~c0&c3|~c2&c3|~c0&c1|c0&~c1);
endmodule

module seg3(input c0,c1,c2,c3,output s);
  assign s = ~(~c0&~c1&~c3|~c0&~c1&c2|c1&~c2&c3|c1&c2&~c3|c0&~c2|c0&~c1&c3);
endmodule

module seg4(input c0,c1,c2,c3,output s);
  assign s = ~((c1|c2|~c3)&(c0|~c3)&(c0|~c1|c2));
endmodule

module seg5(input c0,c1,c2,c3,output s);
  assign s = ~(~c2&~c3|~c0&c1&~c2|c0&~c1|c0&c2|c1&c2&~c3);
endmodule

module seg6(input c0,c1,c2,c3,output s);
  assign s = ~(~c0&c1&~c2|~c0&~c1&c2|c2&~c3|c0&~c1|c0&c3|c0&c2);
endmodule
