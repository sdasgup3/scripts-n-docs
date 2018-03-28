#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

titles[1]="stata-run"
titles[2]="output-strata"
titles[3]="side-channel"
titles[4]="stoke"
titles[5]="stoke_master"
titles[6]="strata"
titles[7]="strata build"
titles[8]="strata docs"
titles[9]="x86-semantics"
titles[10]="junk"
titles[11]="nightlyRuns"

cmds[1]="cd /home/sdasgup3/Github/strata"
cmds[2]="cd /home/sdasgup3/Github/strata-data/output-strata/"
cmds[3]="cd /home/sdasgup3/Github/strata-data/output-strata/"
cmds[4]="cd /home/sdasgup3/Github/strata/stoke"
cmds[5]="cd /home/sdasgup3/Github/stoke"
cmds[6]="cd  /home/sdasgup3/Github/strata"
cmds[7]="cd /home/sdasgup3/Github/strata"
cmds[8]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/docs/relatedwork/strata"
cmds[9]="cd /home/sdasgup3/x86-semantics"
cmds[10]="cd ~/Junk"
cmds[11]="cd /home/sdasgup3/Github/strata-data/output-strata"

for i in 1 2 3 4 5 6 7 8 9 10 11; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )          
done

gnome-terminal "${options[@]}"


exit 0

