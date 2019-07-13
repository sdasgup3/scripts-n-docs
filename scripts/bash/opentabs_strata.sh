#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

titles[1]="instruction-summary"
titles[2]="semantics"
titles[3]="test"
titles[4]="stoke"
titles[5]="stoke_build"
titles[6]="develop_stoke"
titles[7]="develop_stoke_build"
titles[8]="fuzz testing"
titles[9]="htop"
titles[10]="learning K"
titles[11]="k build"
titles[12]="Jnk"

cmds[1]="cd /home/sdasgup3/Github/strata-data/output-strata/instruction-summary"
cmds[2]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/semantics"
cmds[3]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/tests"
cmds[4]="cd /home/sdasgup3/Github/strata/stoke"
cmds[5]="cd /home/sdasgup3/Github/strata/stoke"
cmds[6]="cd  /home/sdasgup3/Github/develop_stoke"
cmds[7]="cd /home/sdasgup3/Github/develop_stoke"
cmds[8]="cd /home/sdasgup3/Github/develop_stoke"
cmds[9]="cd /home/sdasgup3/Junk/"
cmds[10]="cd /home/sdasgup3/Github/learning-K/"
cmds[11]="cd /home/sdasgup3/Github/k5"
cmds[12]="cd /home/sdasgup3/Junk/"

for i in 1 2 3 4 5 6 7 8 9 10 11 12; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )
done

gnome-terminal "${options[@]}"


exit 0

