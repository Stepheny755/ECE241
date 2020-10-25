vlib work
vlog mux7to1.v
vsim mux7to1

log /*
add wave /*

force {x[0]} 0
force {x[1]} 0
force {x[2]} 0
force {x[3]} 1
force {x[4]} 0
force {x[5]} 0
force {x[6]} 1
run 5 ns

force {s[0]} 0
force {s[1]} 0
force {s[2]} 0
run 5 ns

force {s[0]} 0
force {s[1]} 1
force {s[2]} 0
run 5 ns

force {s[0]} 1
force {s[1]} 1
force {s[2]} 0
run 5 ns

force {s[0]} 1
force {s[1]} 1
force {s[2]} 1
run 5 ns

force {s[0]} 0
force {s[1]} 1
force {s[2]} 1
run 5 ns
