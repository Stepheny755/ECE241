vlib work
vlog part2_template.v -timescale "1ns/1ns"
vsim part2

log /*
add wave /*

force {KEY[0]} 1
force {CLOCK_50} 0 0ns, 1 5ns -r 10ns
run 10 ns

force {KEY[0]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns

force {KEY[1]} 1
force {SW[7:0]} 8'd7
run 10 ns

force {KEY[1]} 0
run 10 ns

force {KEY[1]} 1
force {SW[7:0]} 8'd6
run 10 ns

force {KEY[1]} 0
run 10 ns

force {KEY[1]} 1
force {SW[7:0]} 8'd3
run 10 ns

force {KEY[1]} 0
run 10 ns

force {KEY[1]} 1
force {SW[7:0]} 8'd2
run 10 ns

force {KEY[1]} 0
run 10 ns

force {KEY[1]} 1
run 200 ns
