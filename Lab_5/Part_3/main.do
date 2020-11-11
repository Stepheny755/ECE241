vlib work
vlog main.v morse_encoder.v shift_reg.v -timescale "1ns/1ns"
vsim part3

log /*
add wave /*

force {SW[2:0]} 1'd0
force {CLOCK_50} 0 0ns, 1 1ns -r 2ns
force {KEY[0]} 1
run 10 ns

force {KEY[0]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns

force {KEY[1]} 0
run 20 ns

force {KEY[1]} 1
run 40 ns

force {KEY[0]} 0
force {KEY[1]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns

force {SW[2:0]} 3'b101
run 5 ns

force {KEY[1]} 1
run 40 ns
