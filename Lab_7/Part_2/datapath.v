module datapath(
    input clk,
    input resetn,
    input[2:0] colour_in,
    input[6:0] data,
    input ld_rxin, ld_ryin, ld_rxout, ld_ryout, ld_col, selxy,
    input inc, reset_inc,
    output reg[2:0] colour_out,
    output reg[7:0] rxout,
    output reg[6:0] ryout,
    output reg draw_complete
    );

    // input registers
    reg[6:0] rxin,ryin;

    // alu input/outputs
    reg [4:0] rinc;
    reg [1:0] rxinc,ryinc;
    reg [6:0] alu_a,alu_b;
    reg [6:0] alu_out;

    // input registers
    always@(posedge clk) begin
        if(!resetn) begin
            rxin <= 7'b0;
            ryin <= 7'b0;
        end
        else begin
            if(ld_rxin)
                rxin <= data;
            if(ld_ryin)
                ryin <= data;
        end
    end

    // output (x,y) registers
    always@(posedge clk) begin
        if(!resetn) begin
            rxout <= 8'b0;
            ryout <= 7'b0;
        end
        else begin
          if(ld_rxout)
              rxout <= {1'b0,alu_out};
          if(ld_ryout)
              ryout <= alu_out;
        end
    end

    //colour registers
    always@(posedge clk) begin
      if(!resetn) begin
        colour_out <= 3'b0;
      end
      else begin
        if(ld_col)
          colour_out <= colour_in;
      end
    end

    //increment registers
    always@(posedge clk) begin
      if(!resetn) begin
        draw_complete <= 1'b0;
        rinc <= 5'b0;
      end
      else begin
        if(reset_inc)begin
          rinc <= 5'b0;
          draw_complete <= 1'b0;
        end
        else begin
          if(inc)
            rinc <= rinc+1;
        end
      end
      {ryinc,rxinc} <= rinc;
      if(rinc[4]==1'b1)begin
        rinc <= 5'b0;
        draw_complete <= 1'b1;
      end
    end

    // ALU inputs
    always @(*)
    begin
        case (selxy)
            0: begin
              alu_a = rxin;
              alu_b = {5'b0,rxinc};
            end
            1: begin
              alu_a = ryin;
              alu_b = {5'b0,ryinc};
            end
            default: begin
              alu_a = 7'b0;
              alu_b = 7'b0;
            end
        endcase
    end

    // ALU/adder
    always @(*)
    begin
        // alu
        alu_out = alu_a + alu_b;
    end

endmodule
