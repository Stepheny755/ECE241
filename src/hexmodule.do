vlib work
vlog hexmodule.v -timescale "1ns/1ns"
vsim hexencoder

log /*
add wave /*

force {i} 2'd3
run 10 ns

force {i} 2'd8
run 10 ns

force {i} 2'd15
run 10 ns
