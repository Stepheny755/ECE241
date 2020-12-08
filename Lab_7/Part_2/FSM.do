vlib work
vlog FSM.v -timescale "1ns/1ns"
vsim control -L altera_mf_ver

log /*
add wave /*

force {resetn} 1
run 1 ns

force {resetn} 0
force {clk} 0 0ns, 1 1ns -r 2ns
run 1 ns

force {resetn} 1
run 1 ns

force {data}
force {go} 1
run 2 ns

force {go} 0
run 2 ns

force {go} 1
run 2 ns

force {go} 0
run 2 ns

force {go} 1
run 2 ns

force {go} 0
run 2 ns

run 10 ns
