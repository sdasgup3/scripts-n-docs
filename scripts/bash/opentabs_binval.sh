#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd /home/sdasgup3/Github/validating-binary-decompilation/tests"
cmds[2]="cd /home/sdasgup3/Github/validating-binary-decompilation/tests"
cmds[3]="cd /home/sdasgup3/Github/validating-binary-decompilation/tests"
cmds[4]="cd /home/sdasgup3/Github/validating-binary-decompilation/ir_analyzer"
cmds[5]="cd /home/sdasgup3/Github/validating-binary-decompilation/ir_analyzer/build/"
cmds[6]="cd /home/sdasgup3/Github/validating-binary-decompilation/binary_analyzer"
cmds[7]="cd /home/sdasgup3/Github/remill"
cmds[8]="cd ~/Install/llvm/llvm-4.0.0.src/"

titles[1]="tests"
titles[2]="tests"
titles[3]="tests"
titles[4]="ir"
titles[5]="ir"
titles[6]="bin"
titles[7]="remill"
titles[8]="exp"

for i in 1 2 3 4 5 6 7 8; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )
done

gnome-terminal "${options[@]}"


exit 0

