vlib work
vlog main.v main.v hexdecoder.v ram32x4.v -timescale "1ns/1ns"
vsim main -L altera_mf_ver

log /*
add wave /*

force {SW[9]} 1
force {SW[8:4]} 5'b01010
force {SW[3:0]} 4'b0001
run 1 ns

force {KEY[0]} 1
run 1 ns

force {KEY[0]} 0
run 1 ns

force {SW[9]} 1
force {SW[8:4]} 5'b00000
force {SW[3:0]} 4'b1111
run 1 ns

force {KEY[0]} 1
run 1 ns

force {KEY[0]} 0
run 1 ns

force {SW[9]} 0
force {SW[8:4]} 5'd10
run 1 ns

force {KEY[0]} 1
run 1 ns

force {KEY[0]} 0
run 1 ns

force {SW[9]} 0
force {SW[8:4]} 5'd0
run 1 ns

force {KEY[0]} 1
run 1 ns

force {KEY[0]} 0
run 1 ns
