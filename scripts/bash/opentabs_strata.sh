#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

titles[1]="instruction-summary"
titles[2]="semantics"
titles[3]="test"
titles[4]="test"
titles[5]="test"
titles[6]="stoke"
titles[7]="stoke"
titles[8]="stoke_build"
titles[9]="master_stoke"
titles[10]="master_stoke_build"
titles[11]="strata docs"
titles[12]="classification"
titles[13]="htop"
titles[14]="strata.stoke.matte"
titles[15]="paper"
titles[16]="wiki"
titles[17]="learning K"
titles[18]="k build"
titles[19]="Jnk"

cmds[1]="cd /home/sdasgup3/Github/strata-data/output-strata/instruction-summary"
cmds[2]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/semantics"
cmds[3]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/tests"
cmds[4]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/tests"
cmds[5]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/tests"
cmds[6]="cd /home/sdasgup3/Github/strata/stoke"
cmds[7]="cd /home/sdasgup3/Github/strata/stoke"
cmds[8]="cd /home/sdasgup3/Github/strata/stoke"
cmds[9]="cd  /home/sdasgup3/Github/master_stoke"
cmds[10]="cd /home/sdasgup3/Github/master_stoke"
cmds[11]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/docs/relatedwork/strata"
cmds[12]="cd /home/sdasgup3/Github/strata-data/output-strata/instruction-summary/clasification"
cmds[13]="cd /home/sdasgup3/Github/strata-data/output-strata"
cmds[14]="cd /home/sdasgup3/Github/strata.stoke.matte"
cmds[15]="cd /home/sdasgup3/x86-semantics/docs/reports/papers/asplos2019/source"
cmds[16]="cd /home/sdasgup3/Github/binary-decompilation_wiki"
cmds[17]="cd /home/sdasgup3/Github/learning-K/"
cmds[18]="cd /home/sdasgup3/Github/k5"
cmds[19]="cd /home/sdasgup3/Junk/"

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )          
done

gnome-terminal "${options[@]}"


exit 0

