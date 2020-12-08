module mux(x,y,sel,out);
  parameter DATA_WIDTH = 1;
  input wire[DATA_WIDTH-1:0] x,y;
  output reg[DATA_WIDTH-1:0] out;
  always@(*)
  begin
    case(sel)
      0: out = x;
      1: out = y;
  end
endmodule

//mux #(w) m1();
