vlib work
vlog reg.v -timescale "1ns/1ns"
vsim REG

log /*
add wave /*

force {D} 2'd32
force {clk} 0
force {r} 1
run 5 ns

force {clk} 1
force {r} 1
run 5 ns

force {D} 2'd15
force {clk} 0
force {r} 1
run 5 ns

force {clk} 1
force {r} 1
run 5 ns

force {r} 0
force {clk} 0
run 5 ns

force {clk} 1
run 5 ns
