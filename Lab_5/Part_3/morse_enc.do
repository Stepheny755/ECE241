vlib work
vlog morse_encoder.v shift_reg.v -timescale "1ns/1ns"
vsim morse_encoder

log /*
add wave /*

force {clk} 0
force {reset} 1
force {enable} 1
force {loadn} 0
run 1ns

force {reset} 0
force {clk} 1
run 1ns

force {clk} 0
force {reset} 1
run 1ns

force {loadn} 1
force {sel} 2'b11
run 1 ns

force {clk} 1
run 1ns

force {loadn} 0
force {clk} 0
run 1ns

force {clk} 0 0ns, 1 1ns -r 2ns
run 10ns
