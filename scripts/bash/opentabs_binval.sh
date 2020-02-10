#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[0]="cd   /home/sdasgup3/Github/PLDI20-Validating-Decompilers"
cmds[1]="cd   /home/sdasgup3/Github/validating-binary-decompilation/docs/phd-thesis/defence-doc/"
cmds[2]="cd   /home/sdasgup3/Github/validating-binary-decompilation/source/build/"
cmds[3]="cd   /home/sdasgup3/Github/validating-binary-decompilation/source/"
cmds[4]="cd  /home/sdasgup3/Github/stoke-develop"
cmds[5]="cd  /home/sdasgup3/Github/stoke-develop"
cmds[6]="cd   /home/sdasgup3/Github/remill"
cmds[7]="cd   /home/sdasgup3/Github/mcsema"
cmds[8]="cd   /home/sdasgup3/Install/llvm/llvm-4.0.0.src/"
cmds[9]="cd  /home/sdasgup3/Install/llvm/llvm-4.0.0.obj/"
cmds[10]="cd  /home/sdasgup3/Github/llvm-verified-backend"
cmds[11]="cd  /home/sdasgup3/Github/llvm-verified-backend"
cmds[12]="cd  /home/sdasgup3/Github/llvm-verified-backend"
cmds[13]="cd   ~/Github/validating-binary-decompilation/tests/program_translation_validation/toy-examples/"
cmds[14]="cd   ~/Github/validating-binary-decompilation/tests/program_translation_validation/toy-examples/"
cmds[15]="cd   ~/Github/validating-binary-decompilation/tests/program_translation_validation/toy-examples/"
cmds[16]="cd  ~/Github/validating-binary-decompilation/tests/compositional_artifacts_single_instruction_decompilation"
cmds[17]="cd  ~/Junk"
cmds[18]="cd  /home/sdasgup3/Github/validating-binary-decompilation/docs"

titles[0]="paper"
titles[1]="defence-doc"
titles[2]="source-build"
titles[3]="source"
titles[4]="stke"
titles[5]="stoke-build"
titles[6]="remill"
titles[7]="mcsema"
titles[8]="llvm-src"
titles[9]="llvm-build"
titles[10]="llvm-v-test"
titles[11]="llvm-vb"
titles[12]="llvm-vb"
titles[13]="siv"
titles[14]="plv"
titles[15]="tests3"
titles[16]="single-instr-test"
titles[17]="tyler"
titles[18]="aws"

for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )
done

gnome-terminal "${options[@]}"


exit 0

