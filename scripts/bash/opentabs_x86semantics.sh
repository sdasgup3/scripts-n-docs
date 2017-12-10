#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics"
titles[1]="mine"

cmds[2]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/scripts/"
titles[2]="script"

cmds[3]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/tests/"
titles[3]="test"

cmds[4]="cd ~/Junk/k/k-distribution/tests/builtins/negmint-test/"
titles[4]="k exp"

cmds[5]="cd ~/Junk/k/k-distribution/tests/builtins/negmint-test/"
titles[5]="k exp2"

cmds[6]="cd ~/Github/llvm-verified-backend/x86-semantics/"
titles[6]="help"

cmds[7]="cd ~/Github/remill/remill"
titles[7]="Remill"

cmds[8]="cd ~/Github/binary-decompilation/test/decompilation/test_0/"
titles[8]="llvm tests "

cmds[9]="cd /home/sdasgup3/Github/llvm-verified-backend"
titles[9]="llvm semantics "

cmds[10]="cd ~/Junk/Kdump"
titles[10]="Junk Kdump Test"


for i in 1 2 3 4 5 6 7 8 9; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )          
done

gnome-terminal "${options[@]}"


exit 0

