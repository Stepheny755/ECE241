vlib work
vlog main.v alu.v reg.v 4bitrca.v hexdecoder.v
vsim main

log /*
add wave /*

force {KEY[0]} 1
force {SW[9]} 0
run 5 ns

force {KEY[0]} 0
force {SW[9]} 1
run 5 ns

force {KEY[3:1]} 1'd1

run 5 ns

force {KEY[0]} 1
run 5 ns

force {KEY[0]} 0
run 5 ns

force {KEY[0]} 1
run 5 ns

force {KEY[0]} 0
run 5 ns

force {KEY[0]} 1
run 5 ns

force {KEY[0]} 0
run 5 ns

force {KEY[0]} 1
run 5 ns

force {KEY[0]} 0
run 5 ns

force {SW[9]} 0
force {KEY[0]} 1
run 5 ns

force {KEY[3:1]} 0
force {SW[3:0]} 1'd3
run 5 ns

force {KEY[0]} 1
run 5 ns

force {KEY[0]} 0
run 5 ns

force {KEY[0]} 1
run 5 ns

force {KEY[0]} 0
run 5 ns

force {KEY[0]} 1
run 5 ns
