vlib work
vlog morse_encoder.v -timescale "1ns/1ns"
vsim morse_lut

log /*
add wave /*

force {s} 0
run 5 ns

force {s} 1'd1
run 5 ns

force {s} 1'd2
run 5 ns

force {s} 1'd3
run 5 ns
