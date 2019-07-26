#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd /home/sdasgup3/Github/validating-binary-decompilation/tests"
cmds[2]="cd /home/sdasgup3/Github/validating-binary-decompilation/tests"
cmds[3]="cd /home/sdasgup3/Github/validating-binary-decompilation/tests/get_sign/mcsema/"
cmds[4]="cd /home/sdasgup3/Github/validating-binary-decompilation/ir_analyzer/build/"
cmds[5]="cd /home/sdasgup3/Github/validating-binary-decompilation/ir_analyzer/"
cmds[6]="cd /home/sdasgup3/Github/validating-binary-decompilation/binary_analyzer/"
cmds[7]="cd /home/sdasgup3/Github/remill"
cmds[8]="cd /home/sdasgup3/Github/mcsema"
cmds[9]="cd /home/sdasgup3/Install/llvm/llvm-4.0.0.src/"
cmds[10]="cd /home/sdasgup3/Install/llvm/llvm-4.0.0.obj/"
cmds[11]="cd ~/Junk"

titles[1]="tests"
titles[2]="tests"
titles[3]="tests"
titles[4]="ir-build"
titles[5]="ir"
titles[6]="bin"
titles[7]="remill"
titles[8]="mcsema"
titles[9]="llvm-src"
titles[10]="llvm-build"
titles[11]="htop"

for i in 1 2 3 4 5 6 7 8 9 10 11; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )
done

gnome-terminal "${options[@]}"


exit 0

