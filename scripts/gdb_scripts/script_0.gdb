# gdb_scripts| gdb --batch --command=./gdb_scripts/run_bt_on_call.gdb --args ./a.out 

set logging file gdb.txt
set logging on
b sll_insert_sorted
commands
bt
continue
end
info breakpoints
r
set logging off
quit
