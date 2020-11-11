vlib work
vlog main.v mux.v d_ff.v
vsim rotating_reg_8bit

log /*
add wave /*

force {clk} 0
force {reset} 1
run 1ns

force {clk} 1
run 1ns

force {clk} 0
force {reset} 0
run 1ns

force {Data_In} 1'd3
force {parallelLoadn} 0
force {ASRight} 0
run 1ns

force {clk} 1
run 1ns

force {parallelLoadn} 1
force {RotateRight} 1
run 5ns

force {clk} 0 0ns, 1 1ns -r 2ns
run 10ns

force {parallelLoadn} 1
force {RotateRight} 0
run 8ns

force {parallelLoadn} 1
force {RotateRight} 1
force {ASRight} 1
run 10ns

force {parallelLoadn} 1
force {RotateRight} 0
force {ASRight} 1
run 10ns
