module datapath(
    input clk,
    input resetn,
    input[6:0] xpos,
    input[6:0] ypos,
    input[3:0] colour,
    input ld_rxin, ld_ryin, ld_rxout, ld_ryout
    input selxy,
    input[1:0] inc,
    output reg[7:0] rxout,
    output reg[6:0] ryout);

    // input registers
    reg[6:0] rxin,ryin;

    // alu input/outputs
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
                rxin <= xpos
            if(ld_ryin)
                ryin <= ypos;
        end
    end

    // output registers
    always@(posedge clk) begin
        if(!resetn) begin
            rxout <= 8'b0;
            ryout <= 7'b0;
        if(ld_rxout)
            rxout <= alu_out;
        if(ld_ryout)
            ryout <= alu_out;
        end
    end

    // ALU inputs
    always @(*)
    begin
        case (selxy)
            0:
              alu_a = rxin;
            1:
              alu_a = ryin;
            default:
              alu_a = 7'b0;
        endcase
        alu_b = {5'b0,inc};
    end

    // ALU/adder
    always @(*)
    begin : ALU
        // alu
        alu_out = alu_a + alu_b;
    end

endmodule
