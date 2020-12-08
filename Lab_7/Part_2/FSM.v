module control(
    input clk,
    input resetn,
    input go,

    output reg  ld_a, ld_b, ld_c, ld_x, ld_r,
    output reg  ld_alu_out,
    output reg [1:0]  alu_select_a, alu_select_b,
    output reg alu_op


    input clk,
    input resetn,
    input go,
    input black, plot,

    output reg ld_rxin, ld_ryin, ld_rxout, ld_ryout, ld_col, selxy,
    output reg[2:0] xinc,yinc,
    output reg[7:0] rxout,
    output reg[6:0] ryout);
    );

    reg [5:0] current_state, next_state;

    localparam  S_LOAD_X        = 5'd0,
                S_LOAD_X_WAIT   = 5'd1,
                S_LOAD_Y        = 5'd2,
                S_LOAD_Y_WAIT   = 5'd3,
                S_LOAD_COL      = 5'd4,
                S_LOAD_COL_WAIT = 5'd5,
                S_CYCLE_0       = 5'd8,
                S_CYCLE_1       = 5'd9,
                S_CYCLE_2       = 5'd10,
                S_CYCLE_3       = 5'd11,
                S_CYCLE_4       = 5'd12;

    // Next state logic aka our state table
    always@(*)
    begin: state_table
            case (current_state)
                S_LOAD_X: next_state = go ? S_LOAD_X_WAIT : S_LOAD_X;
                S_LOAD_X_WAIT: next_state = go ? S_LOAD_X_WAIT : S_LOAD_Y;
                S_LOAD_Y: next_state = go ? S_LOAD_Y_WAIT : S_LOAD_Y;
                S_LOAD_Y_WAIT: next_state = go ? S_LOAD_Y_WAIT : S_LOAD_COL;
                S_LOAD_COL: next_state = go ? S_LOAD_COL_WAIT : S_LOAD_COL;
                S_LOAD_COL_WAIT: next_state = go ? S_LOAD_COL_WAIT : S_CYCLE_0
                S_CYCLE_0: next_state = S_CYCLE_1;
                S_CYCLE_1: next_state = S_CYCLE_2;
                S_CYCLE_2: next_state = S_CYCLE_3;
                S_CYCLE_3: next_state = S_CYCLE_4;
                S_CYCLE_4: next_state = S_LOAD_X; // we will be done our two operations, start over after
            default:     next_state = S_LOAD_X;
        endcase
    end // state_table


    // Output logic aka all of our datapath control signals
    always @(*)
    begin: enable_signals
        // By default make all our signals 0

        ld_rxin = 1'b0;
        ld_ryin = 1'b0;
        ld_rxout = 1'b0;
        ld_ryout = 1'b0;
        ld_col = 1'b0;
        selxy = 1'b0;

        case (current_state)
            S_LOAD_X: begin
                ld_rxin = 1'b1;
                end
            S_LOAD_Y: begin
                ld_ryin = 1'b1;
                end
            S_LOAD_COL: begin
                ld_col = 1'b1;
                end
            S_CYCLE_0: begin

                ld_alu_out = 1'b1; ld_a = 1'b1; // store result in reg a
                alu_select_a = 2'd0; // Select reg a
                alu_select_b = 2'd3; // Select reg x
                alu_op = 1'b1; // multiply
            end
            S_CYCLE_1: begin // A <= A*x^2 = A*x
                ld_alu_out = 1'b1; ld_a = 1'b1; // store result in reg a
                alu_select_a = 2'd0; // Select reg a
                alu_select_b = 2'd3; // Select reg x
                alu_op = 1'b1; // multiply
            end
            //done Ax^2

            S_CYCLE_2: begin // B <= B*x
                ld_alu_out = 1'b1; ld_b = 1'b1; // store result in reg b
                alu_select_a = 2'd1; // Select reg b
                alu_select_b = 2'd3; // Select reg x
                alu_op = 1'b1; // multiply
            end
            //done Bx

            S_CYCLE_3: begin // B <= B*x + C
                ld_alu_out = 1'b1; ld_b = 1'b1; // store result in reg b
                alu_select_a = 2'd1; // Select reg b
                alu_select_b = 2'd2; // Select reg c
                alu_op = 1'b0; // add
            end
            //done Bx+C

            S_CYCLE_4: begin // r <= Ax^2+Bx+C = A+B
                ld_r = 1'b1; // store result in result reg
                alu_select_a = 2'd0; // Select reg a
                alu_select_b = 2'd1; // Select reg x
                alu_op = 1'b0; // add
            end
        // default:    // don't need default since we already made sure all of our outputs were assigned a value at the start of the always block
        endcase
    end // enable_signals

    // current_state registers
    always@(posedge clk)
    begin: state_FFs
        if(!resetn)
            current_state <= S_LOAD_X;
        else
            current_state <= next_state;
    end // state_FFS
endmodule
