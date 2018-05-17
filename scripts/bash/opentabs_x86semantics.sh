#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/semantics/"
cmds[2]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/semantics"
cmds[3]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/docs/instruction-summary/clasification//"
cmds[4]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/tests/"
cmds[5]="cd /home/sdasgup3/Github/k5"
cmds[6]="cd /home/sdasgup3/Github/k5"
cmds[7]="cd ~/Github/learning-K"
cmds[8]="cd ~/Github/llvm-verified-backend/x86-semantics/"
cmds[9]="cd /home/sdasgup3/Github/llvm-verified-backend"
cmds[10]="cd /home/sdasgup3/Github/c-semantics"
cmds[11]="cd ~/Github/remill/remill"
cmds[12]="cd ~/Junk"

titles[1]="semantics"
titles[2]="semantics"
titles[3]="classification/"
titles[4]="tests/"
titles[5]="k5"
titles[6]="k5"
titles[7]="learning-K"
titles[8]="x86-semantics/"
titles[9]="llvm-verified-backend"
titles[10]="c-semantics"
titles[11]="remill"
titles[12]="Junk"

for i in 1 2 3 4 5 6 7 8 9 10 11 12; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )          
done

gnome-terminal "${options[@]}"


exit 0

