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

force {ld_col} 1
force {colour_in} 3'b001

force {data} 7'd100
force {ld_rxin} 1
force {inc} 3'b100

run 1 ns

force {clk} 1
run 1 ns

force {ld_rxin} 0
force {clk} 0
force {data} 7'd56
force {ld_ryin} 1
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
run 1 ns

force {clk} 1
run 1 ns

force {clk} 0 0ns, 1 1ns -r 2ns
force {inc} 1
force {ld_rxout} 1
run 20 ns
