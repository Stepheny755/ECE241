vlib work
vlog main.v t_ff.v hexdecoder.v -timescale "1ns/1ns"
vsim part1

log /*
add wave /*

force {SW[0]} 0
force {SW[1]} 0
force {KEY} 1
run 5 ns

force {SW[1]} 1
run 5 ns

force {KEY} 0
run 5 ns

force {KEY} 1
run 5 ns

force {KEY} 0
force {SW[0]} 1
run 5 ns

force {KEY} 1
run 5 ns

force {KEY} 0
run 5 ns

force {KEY} 1
run 5 ns

force {KEY} 0
run 5 ns

force {KEY} 1
run 5 ns
