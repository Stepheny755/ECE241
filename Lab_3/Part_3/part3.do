vlib work
vlog main.v
vsim ALU

log /*
add wave /*


force {A[0]} 0
force {A[1]} 1
force {A[2]} 1
force {A[3]} 1
force {B[0]} 0
force {B[1]} 1
force {B[2]} 1
force {B[3]} 1
force {f[0]} 1
force {f[1]} 0
force {f[2]} 0
run 5 ns

force {A[0]} 0
force {A[1]} 1
force {A[2]} 1
force {A[3]} 1
force {B[0]} 0
force {B[1]} 1
force {B[2]} 1
force {B[3]} 1
force {f[0]} 0
force {f[1]} 0
force {f[2]} 0
run 5 ns

force {A[0]} 0
force {A[1]} 1
force {A[2]} 0
force {A[3]} 1
force {B[0]} 0
force {B[1]} 1
force {B[2]} 1
force {B[3]} 1
force {f[0]} 1
force {f[1]} 0
force {f[2]} 1
run 5 ns

force {A[0]} 0
force {A[1]} 0
force {A[2]} 0
force {A[3]} 0
force {B[0]} 0
force {B[1]} 0
force {B[2]} 0
force {B[3]} 0
force {f[0]} 1
force {f[1]} 1
force {f[2]} 0
run 5 ns

force {A[0]} 0
force {A[1]} 0
force {A[2]} 0
force {A[3]} 1
force {B[0]} 0
force {B[1]} 0
force {B[2]} 0
force {B[3]} 0
force {f[0]} 1
force {f[1]} 1
force {f[2]} 0
run 5 ns

force {A[0]} 0
force {A[1]} 0
force {A[2]} 0
force {A[3]} 0
force {B[0]} 0
force {B[1]} 0
force {B[2]} 0
force {B[3]} 0
force {f[0]} 0
force {f[1]} 0
force {f[2]} 1
run 5 ns

force {A[0]} 1
force {A[1]} 1
force {A[2]} 1
force {A[3]} 1
force {B[0]} 1
force {B[1]} 1
force {B[2]} 1
force {B[3]} 1
force {f[0]} 0
force {f[1]} 0
force {f[2]} 1
run 5 ns
