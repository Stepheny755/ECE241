vlib work
vlog hexdecoder.v
vsim seg1

log /*
add wave /*

force c0 0
force c1 0
force c2 0
force c3 0
run 1 ns

force c0 1
force c1 0
force c2 0
force c3 0
run 1 ns

force c0 0
force c1 1
force c2 0
force c3 0
run 1 ns

force c0 1
force c1 1
force c2 0
force c3 0
run 1 ns

force c0 0
force c1 1
force c2 1
force c3 0
run 1 ns

force c0 1
force c1 0
force c2 1
force c3 1
run 1 ns

force c0 1
force c1 1
force c2 0
force c3 1
run 1 ns

force c0 1
force c1 1
force c2 1
force c3 1
run 1 ns
