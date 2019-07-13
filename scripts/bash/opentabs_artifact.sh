#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd /home/sdasgup3/Github/binary-decompilation_programV_working/semantics"
cmds[2]="cd /home/sdasgup3/Github/binary-decompilation_programV_working/semantics/../tests/Programs"
cmds[3]="cd /home/sdasgup3/Github/binary-decompilation_programV_working/semantics/../tests/Programs"
cmds[4]="cd /home/sdasgup3/Github/k5_programV_working"
cmds[5]="cd ~/Junk"
cmds[6]="cd ~/Junk"
cmds[7]="cd ~/Junk"

titles[1]="PVsemantics"
titles[2]="PVtests"
titles[3]="PVtests/"
titles[4]="PVk5"
titles[5]="Junk"
titles[6]="Junk"
titles[7]="Junk"

for i in 1 2 3 4 5 6 7 ; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )          
done

gnome-terminal "${options[@]}"


exit 0

