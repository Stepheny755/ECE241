vlib work
vlog datapath.v -timescale "1ns/1ns"
vsim datapath -L altera_mf_ver

log /*
add wave /*

force {resetn} 1
force {clk} 0

run 1 ns

force {resetn} 0
force {clk} 1

run 1 ns

force {resetn} 1
force {clk} 0

run 1 ns

force {xpos} 7'd100
force {ypos} 7'd56
force {ld_rxin} 1
force {ld_ryin} 1
force {inc} 3'b100

run 1 ns

force {clk} 1
run 1 ns

force {selxy} 0
force {ld_rxin} 0
force {ld_ryin} 0
force {ld_rxout} 1
force {clk} 0

run 1 ns

force {clk} 1
force {ld_rxout} 0
run 1 ns

force {clk} 0
force {resetn} 0
run 1 ns

force {clk} 1
run 1 ns
