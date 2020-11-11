module morse_encoder(input clk,reset,enable,input[2:0] sel,output out);

  wire[15:0] morse_string,Q;

  morse_lut codes(.s(sel),.q(morse_string));

  shift_reg_16bit s_reg(.w(1'b0),.clk(clk),.reset(reset),.loadn(!enable),.enable(enable),.d(morse_string),.q(Q));

  assign out = Q[15]&enable;

endmodule

module morse_lut(input[2:0] s,output reg[15:0] q);
  always@(*)
    begin
      case(s)
        3'b000: q={5'b10111,11'b0};
        3'b001: q={9'b111010101,7'b0};
        3'b010: q={11'b11101011101,5'b0};
        3'b011: q={7'b1110101,9'b0};
        3'b100: q={1'b1,15'b0};
        3'b101: q={9'b101011101,7'b0};
        3'b110: q={9'b111011101,7'b0};
        3'b111: q={7'b1010101,9'b0};
        default: q=16'b0;
      endcase
    end
endmodule
