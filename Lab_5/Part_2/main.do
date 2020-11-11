vlib work
vlog main.v counter.v hexdecoder.v -timescale "1ns/1ns"
vsim part2

log /*
add wave /*

force {SW[1:0]} 1'd0
force {CLOCK_50} 0 0ns, 1 1ns -r 2ns
force {SW[9]} 1
run 20 ns

force {SW[9]} 0
run 20 ns

force {SW[9]} 1
run 20 ns

force {SW[1:0]} 1'd1
run 100000000 ns

force {SW[1:0]} 1'd2
run 100000000 ns

force {SW[1:0]} 1'd0
run 100000000 ns
