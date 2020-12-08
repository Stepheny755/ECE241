module control(
    input clk,
    input resetn,
    input go,
    input black, plot_in,

    output reg ld_rxin, ld_ryin, ld_rxout, ld_ryout, ld_col, selxy,
    output reg xinc,yinc,reset_xinc,reset_yinc,
    output reg plot_out
    );

    reg [5:0] current_state, next_state;

    localparam  S_LOAD_X        = 5'd0,
                S_LOAD_X_WAIT   = 5'd1,
                S_LOAD_Y        = 5'd2,
                S_LOAD_Y_WAIT   = 5'd3,
                S_LOAD_COL      = 5'd4,
                S_LOAD_COL_WAIT = 5'd5,
                S_CYCLE_X       = 5'd6,
                S_CYCLE_INCX    = 5'd7,
                S_CYCLE_Y       = 5'd8,
                S_CYCLE_INCY    = 5'd9,
                S_CYCLE_DONE    = 5'd10;

    // Next state logic aka our state table
    always@(*)
    begin: state_table
            case (current_state)
                S_LOAD_X: next_state = go ? S_LOAD_X_WAIT : S_LOAD_X;
                S_LOAD_X_WAIT: next_state = go ? S_LOAD_X_WAIT : S_LOAD_Y;
                S_LOAD_Y: next_state = go ? S_LOAD_Y_WAIT : S_LOAD_Y;
                S_LOAD_Y_WAIT: next_state = go ? S_LOAD_Y_WAIT : S_LOAD_COL;
                S_LOAD_COL: next_state = go ? S_LOAD_COL_WAIT : S_LOAD_COL;
                S_LOAD_COL_WAIT: next_state = go ? S_LOAD_COL_WAIT : S_CYCLE_X;
                S_CYCLE_X: next_state = S_CYCLE_INCX;
                S_CYCLE_INCX : next_state = S_CYCLE_Y;
                S_CYCLE_Y: next_state = S_CYCLE_INCY;
                S_CYCLE_INCY: next_state = S_CYCLE_DONE;
                S_CYCLE_DONE: next_state = S_LOAD_X;
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
        xinc = 1'b0;
        yinc = 1'b0;
        reset_xinc = 1'b0;
        reset_yinc = 1'b0;

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
            S_CYCLE_X: begin
                selxy = 1'b0;
                ld_rxout = 1'b1;
            end
            S_CYCLE_INCX: begin

            end
            S_CYCLE_Y: begin
                selxy = 1'b1;
                ld_rxout = 1'b1;
            end
            S_CYCLE_INCY: begin // B <= B*x + C

            end
            S_CYCLE_DONE: begin
                plot_out =
            end
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
