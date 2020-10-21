module top(input[1:0] sel,input[3:0] h,m,l,output[1:0] tanklevel)://parameters:
  wire[1:0] t1,t2,t3,t4; //represent each tank and it's 2 bit level representation
  displaylevel d1(h[0],m[0],l[0],t1);
  //from the first set of sensor readings (index 0), get 2 bit display level of tank 1
  displaylevel d2(h[1],m[1],l[1],t2);
  //from the first set of sensor readings (index 1), get 2 bit display level of tank 2
  displaylevel d3(h[2],m[2],l[2],t3);
  //from the first set of sensor readings (index 2), get 2 bit display level of tank 3
  displaylevel d4(h[3],m[3],l[3],t4);
  //from the first set of sensor readings (index 3), get 2 bit display level of tank 4

  mux4to1 m(sel,t1,t2,t3,t4,tanklevel);
  //using sel (s1,s0) to switch between displayed tank level
  //can use hex encoder to drive 7 segment display using "tanklevel" value
endmodule

module mux4to1(input[1:0] sel,a,b,c,d,output[1:0] f);
  wire[1:0] w1,w2;
  mux2to1 m1(sel[0],a,b,w1);
  mux2to1 m2(sel[0],c,d,w2);
  mux2to1 m3(sel[1],w1,w2,f);
endmodule

module displaylevel(input h,m,l,output reg[1:0] level);
  always@(*)
    begin
      if(h==1)
        level=2'b10;
      else begin
        if(m==1)
          level=2'b01;
        else
          level=2'b00;
      end
    end
endmodule

module mux2to1_2bit(input s,input[1:0] x,y,output[1:0] f);
  //assuming this module is declared
endmodule
