# gdb --batch --command=./script_2.gdb --args ./a.out 
set width 0
set height 0
set verbose off
set disassemble-next-line on

define process_instr
    p $rax
    p $rcx
    p $eflags
end

define nstep
 set $foo = $arg0
 while ($foo--)
  ni
  process_instr
 end
end

b _start
r
nstep 3
q
