vlib work
vlog main.v -timescale "1ns/1ns"
vsim part1

log /*
add wave /*

force {KEY[0]} 0 0ns, 1 5ns -r 10ns
run 10 ns

force {SW[1]]} 1
run 50 ns

force {SW[1]]} 0
run 10 ns

force {SW[1]]} 1
run 40 ns
