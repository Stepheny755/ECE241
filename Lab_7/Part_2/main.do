vlib work
vlog main.v datapath.v FSM.v -timescale "1ns/1ns"
vsim wrapper -L altera_mf_ver -L altera_mf

log /*
add wave /*

force {resetn} 1
run 1 ns

force {resetn} 0
force {clk} 0 0ns, 1 1ns -r 2ns
run 1 ns

force {resetn} 1
force {go} 0
force {plot_in} 0
run 1 ns

force {data} 7'd57
run 2 ns

force {go} 1
run 2 ns

force {go} 0
run 2 ns

force {data} 7'd13
run 2 ns

force {go} 1
run 2 ns

force {go} 0
run 2 ns

force {colour_in} 3'd0
force {go} 1
run 2 ns

force {go} 0
run 2 ns

force {plot_in} 1
run 2 ns

force {plot_in} 0
run 2 ns

run 150 ns



force {data} 7'd100
run 2 ns

force {go} 1
run 2 ns

force {go} 0
run 2 ns

force {data} 7'd7
run 2 ns

force {go} 1
run 2 ns

force {go} 0
run 2 ns

force {colour_in} 3'd2
force {go} 1
run 2 ns

force {go} 0
run 2 ns

force {plot_in} 1
run 2 ns

force {plot_in} 0
run 2 ns

run 150 ns
