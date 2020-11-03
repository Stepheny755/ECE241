vlib work
vlog main.v mux.v d_ff.v
vsim rotating_reg

log /*
add wave /*

force {clk} 0
force {reset} 0
run 1ns

force {reset} 1
force {clk} 1
run 1ns

force {clk} 0
force {reset} 0
run 1ns

force {D} 1
force {loadn} 0
run 1ns

force {clk} 1
run 1ns
