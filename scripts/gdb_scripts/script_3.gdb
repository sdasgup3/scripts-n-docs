# gdb --batch --command=./script_2.gdb --args ./a.out 
set width 0
set height 0
set verbose off
set disassemble-next-line on

define process_instr
    printf "RAX: (0x%X)\n",$rax
end

define nstep
 set $foo = $arg0
 while ($foo--)
  ni
  process_instr
 end
end

start
nstep 10
q
