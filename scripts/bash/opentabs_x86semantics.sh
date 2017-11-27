#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics"
titles[1]="mine"

cmds[2]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/tests/"
titles[2]="test"

cmds[3]="cd ~/Junk/k/k-distribution/tests/builtins/negmint-test/"
titles[3]="k exp"

cmds[4]="cd ~/Junk/k/k-distribution/tests/builtins/negmint-test/"
titles[4]="k exp2"

cmds[5]="cd ~/Github/llvm-verified-backend/x86-semantics/"
titles[5]="help"

cmds[6]="cd ~/Github/remill/remill"
titles[6]="Remill"

cmds[7]="cd ~/Github/binary-decompilation/test/decompilation/test_0/"
titles[6]="llvm tests "

cmds[8]="cd ~/Junk/"
titles[8]="Junk Test"


for i in 1 2 3 4 5 6 7 8; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )          
done

gnome-terminal "${options[@]}"


exit 0

