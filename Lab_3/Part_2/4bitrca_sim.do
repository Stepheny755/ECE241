vlib work
vlog main.v
vsim RCA_4bit

log /*
add wave /*

force {a[0]} 0
force {a[1]} 0
force {a[2]} 0
force {a[3]} 0
force {b[0]} 0
force {b[1]} 0
force {b[2]} 0
force {b[3]} 0
force {cin[6]} 0
run 5 ns

force {a[0]} 1
force {a[1]} 0
force {a[2]} 0
force {a[3]} 0
force {b[0]} 1
force {b[1]} 0
force {b[2]} 0
force {b[3]} 0
force {cin[6]} 0
run 5 ns

force {a[0]} 1
force {a[1]} 0
force {a[2]} 1
force {a[3]} 1
force {b[0]} 1
force {b[1]} 0
force {b[2]} 0
force {b[3]} 0
force {cin[6]} 0
run 5 ns

force {a[0]} 1
force {a[1]} 0
force {a[2]} 1
force {a[3]} 1
force {b[0]} 1
force {b[1]} 0
force {b[2]} 0
force {b[3]} 1
force {cin[6]} 0
run 5 ns
