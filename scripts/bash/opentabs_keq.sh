#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd /home/sdasgup3/Github/X86-64-semantics/semantics"
cmds[2]="cd /home/sdasgup3/Github/X86-64-semantics/semantics/../tests"
cmds[3]="cd /home/sdasgup3/Github/X86-64-semantics/semantics/../tests"
cmds[4]="cd ~//Install/llvm/"
cmds[5]="cd /home/sdasgup3/Github/k5"
cmds[6]="cd /home/sdasgup3/Github/keq"
cmds[7]="cd /home/sdasgup3/Github/llvm-verified-backend"
cmds[8]="cd /home/sdasgup3/Github/llvm-verified-backend"
cmds[9]="cd ~/Github/learning-K"
cmds[10]="cd ~/Github/learning-K"
cmds[11]="cd ~/Junk"
cmds[12]="cd ~/Junk"
cmds[13]="cd ~/Junk"

titles[1]="semantics"
titles[2]="tests"
titles[3]="tests/"
titles[4]="llvm-bin"
titles[5]="k5"
titles[6]="keq"
titles[7]="llvm-sema"
titles[8]="llvm0-sema"
titles[9]="learning-K"
titles[10]="htop"
titles[11]="tyler"
titles[12]="Junk"
titles[13]="Junk"

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )          
done

gnome-terminal "${options[@]}"


exit 0

