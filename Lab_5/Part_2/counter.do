vlib work
vlog counter.v -timescale "1ns/1ns"
vsim counter_8bit

log /*
add wave /*

force {enable} 1
force {clk} 0
force {reset} 0
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
force {reset} 1
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
run 5 ns

force {clk} 1
run 5 ns
