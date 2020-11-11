vlib work
vlog t_ff.v -timescale "1ns/1ns"
vsim t_ff

log /*
add wave /*

force {t} 0
force {clk} 0
force {reset} 1
run 5 ns

force {reset} 0
run 5 ns

force {reset} 1
force {clk} 1
run 5 ns

force {t} 1
force {clk} 0
run 5 ns

force {clk} 1
run 5 ns

force {clk} 0
run 5 ns

force {clk} 1
run 5 ns

force {reset} 0
force {clk} 0
run 5 ns

force {clk} 1
run 5 ns
