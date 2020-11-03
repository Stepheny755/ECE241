vlib work
vlog d_ff.v -timescale "1ns/1ns"
vsim flipflop

log /*
add wave /*

force {d} 0
force {clk} 0
force {reset} 0
run 5 ns

force {clk} 1
force {reset} 0
run 5 ns

force {d} 1
force {clk} 0
force {reset} 0
run 5 ns

force {clk} 1
force {reset} 0
run 5 ns

force {reset} 1
force {clk} 0
run 5 ns

force {clk} 1
run 5 ns
