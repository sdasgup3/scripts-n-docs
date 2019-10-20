#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd   /home/sdasgup3/Github/validating-binary-decompilation/source/build/"
cmds[2]="cd   /home/sdasgup3/Github/validating-binary-decompilation/source/"
cmds[3]="cd  /home/sdasgup3/Github/stoke-develop"
cmds[4]="cd  /home/sdasgup3/Github/stoke-develop"
cmds[5]="cd   /home/sdasgup3/Github/remill"
cmds[6]="cd   /home/sdasgup3/Github/mcsema"
cmds[7]="cd   /home/sdasgup3/Install/llvm/llvm-4.0.0.src/"
cmds[8]="cd  /home/sdasgup3/Install/llvm/llvm-4.0.0.obj/"
cmds[9]="cd  /home/sdasgup3/Github/llvm-verified-backend"
cmds[10]="cd  /home/sdasgup3/Github/llvm-verified-backend"
cmds[11]="cd  /home/sdasgup3/Github/llvm-verified-backend"
cmds[12]="cd   ~/Github/validating-binary-decompilation/tests/program_translation_validation/toy-examples/"
cmds[13]="cd   ~/Github/validating-binary-decompilation/tests/program_translation_validation/toy-examples/"
cmds[14]="cd   ~/Github/validating-binary-decompilation/tests/program_translation_validation/toy-examples/"
cmds[15]="cd  ~/Github/validating-binary-decompilation/tests/compositional_artifacts_single_instruction_decompilation"
cmds[16]="cd  ~/Junk"
cmds[17]="cd  /home/sdasgup3/Github/validating-binary-decompilation/docs"

titles[1]="source-build"
titles[2]="source"
titles[3]="stke"
titles[4]="stoke-build"
titles[5]="remill"
titles[6]="mcsema"
titles[7]="llvm-src"
titles[8]="llvm-build"
titles[9]="llvm-v-test"
titles[10]="llvm-vb"
titles[11]="llvm-vb"
titles[12]="tests1"
titles[13]="tests2"
titles[14]="tests3"
titles[15]="single-instr-test"
titles[16]="tyler"
titles[17]="aws"

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )
done

gnome-terminal "${options[@]}"


exit 0

