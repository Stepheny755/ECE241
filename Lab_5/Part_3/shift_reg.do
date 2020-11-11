vlib work
vlog shift_reg.v -timescale "1ns/1ns"
vsim shift_reg_16bit

log /*
add wave /*

force {clk} 0
force {reset} 1
force {enable} 1
run 1ns

force {reset} 0
force {clk} 1
run 1ns

force {clk} 0
force {reset} 1
run 1ns

force {w} 1
force {loadn} 0
run 1ns

force {clk} 1
run 1ns

force {clk} 0
force {w} 0
run 1ns

force {clk} 1
run 1ns

force {clk} 0
run 1ns

force {clk} 1
run 1ns

force {clk} 0
run 1ns

force {clk} 1
run 1ns

force {clk} 0
run 1ns

force {d} 5'b11101
force {loadn} 1
force {clk} 1
run 1 ns

force {clk} 0
run 1 ns

force {clk} 1
run 1 ns

force {loadn} 0
force {clk} 0
run 1 ns

force {clk} 1
run 1 ns

force {clk} 0
run 1 ns

force {clk} 1
run 1 ns

force {clk} 0
run 1 ns

force {clk} 1
run 1 ns

force {clk} 0
run 1 ns

force {clk} 1
run 1 ns
