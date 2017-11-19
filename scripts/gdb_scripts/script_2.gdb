# gdb --batch --command=./script_2.gdb --args ./a.out 
set width 0
set height 0
set verbose off

define walk_list
  set $temp = $arg0
  while ($temp)
    printf "(%d,0x%X)-->",((sll*)$temp)->data,((sll*)$temp)->next
    set $temp = ((sll*)$temp)->next
  end
  printf "Done\n"
end

define nstep
 set $foo = $arg0
 while ($foo--)
#walk_list head
  next
 end
end

b test_0.c:130
r
nstep 6
q
