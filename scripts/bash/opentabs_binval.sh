#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd   /home/sdasgup3/Github/validating-binary-decompilation/tests/"
cmds[2]="cd   /home/sdasgup3/Github/validating-binary-decompilation/tests/"
cmds[3]="cd   /home/sdasgup3/Github/validating-binary-decompilation/tests/move/mcsema/"
cmds[4]="cd   /home/sdasgup3/Github/validating-binary-decompilation/source/build/"
cmds[5]="cd   /home/sdasgup3/Github/validating-binary-decompilation/source/"
cmds[6]="cd  /home/sdasgup3/Github/stoke-develop"
cmds[7]="cd  /home/sdasgup3/Github/stoke-develop"
cmds[8]="cd   /home/sdasgup3/Github/remill"
cmds[9]="cd   /home/sdasgup3/Github/mcsema"
cmds[10]="cd   /home/sdasgup3/Install/llvm/llvm-4.0.0.src/"
cmds[11]="cd  /home/sdasgup3/Install/llvm/llvm-4.0.0.obj/"
cmds[12]="cd  /home/sdasgup3/Github/llvm-verified-backend"
cmds[13]="cd  /home/sdasgup3/Github/llvm-verified-backend"
cmds[14]="cd  /home/sdasgup3/Github/llvm-verified-backend"
cmds[15]="cd  /home/sdasgup3/Github/validating-binary-decompilation/single_instruction_translation_validation/tests/xorq_r64_r64"
cmds[16]="cd  ~/Junk"
cmds[17]="cd  ~/Junk"

titles[1]="tests"
titles[2]="tests"
titles[3]="tests"
titles[4]="source-build"
titles[5]="source"
titles[6]="stke"
titles[7]="stoke-build"
titles[8]="remill"
titles[9]="mcsema"
titles[10]="llvm-src"
titles[11]="llvm-build"
titles[12]="llvm-v-test"
titles[13]="llvm-vb"
titles[14]="llvm-vb"
titles[15]="single-instr-test"
titles[16]="tyler"
titles[17]="Junk"

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )
done

gnome-terminal "${options[@]}"


exit 0

