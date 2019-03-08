#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd /home/sdasgup3/Github/X86-64-semantics/semantics"
cmds[2]="cd /home/sdasgup3/Github/X86-64-semantics/semantics/../tests"
cmds[3]="cd /home/sdasgup3/Github/X86-64-semantics/semantics/../tests"
cmds[4]="cd /home/sdasgup3/Github/k5"
cmds[5]="cd /home/sdasgup3/Github/keq"
cmds[6]="cd /home/sdasgup3/Github/llvm-verified-backend"
cmds[7]="cd /home/sdasgup3/Github/llvm-verified-backend"
cmds[8]="cd ~/Github/learning-K"
cmds[9]="cd ~/Junk"
cmds[10]="cd ~/Junk"

titles[1]="semantics"
titles[2]="tests"
titles[3]="tests/"
titles[4]="k5"
titles[5]="keq"
titles[6]="llvm"
titles[7]="llvm"
titles[8]="learning-K"
titles[9]="junk"
titles[10]="Junk"

for i in 1 2 3 4 5 6 7 8 9 10 ; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )          
done

gnome-terminal "${options[@]}"


exit 0

