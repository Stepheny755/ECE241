module display4bit(input[3:0] c,output[6:0]s);
  always@(*) begin
    case(c)
      4'b0000:7'b0111111;
      4'b0001:7'b0000110;
      4'b0010:7'b1011011;
      4'b0011:7'b1001111;
      4'b0100:7'b1100110;
      4'b0101:7'b1101101;
      4'b0110:7'b1111101;
      4'b0111:7'b0000111;
      4'b1000:7'b1111111;
      4'b1001:7'b1101111;
      4'b1010:7'b1110111;
      4'b1011:7'b1111100;
      4'b1100:7'b0111001;
      4'b1101:7'b1011110;
      4'b1110:7'b1111001;
      4'b1111:7'b1110001;
    endcase
  end
endmodule