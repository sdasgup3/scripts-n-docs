#!/bin/bash


tab=" --tab"
options=()  #(--tab --title=Terminal)

cmds[1]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics"
titles[1]="mine"

cmds[2]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/scripts/"
titles[2]="script"

cmds[3]="cd /home/sdasgup3/Github/binary-decompilation/x86-semantics/tests/"
titles[3]="test"

cmds[4]="cd /home/sdasgup3/Github/k"
titles[4]="k exp"

cmds[5]="cd /home/sdasgup3/Github/k"
titles[5]="k exp2"

cmds[6]="cd ~/Github/llvm-verified-backend/x86-semantics/"
titles[6]="help"

cmds[7]="cd ~/Github/remill/remill"
titles[7]="Remill"

cmds[8]="cd ~/Github/binary-decompilation/test/decompilation/test_0/"
titles[8]="llvm tests "

cmds[9]="cd /home/sdasgup3/Github/llvm-verified-backend"
titles[9]="llvm semantics "

cmds[10]="cd /home/sdasgup3/Github/c-semantics"
titles[10]="c semantics"

cmds[11]="cd ~/Install/strata/stoke"
titles[11]="Strata::Stoke"

cmds[12]="cd ~/Github/strata-data"
titles[12]="DStrata"

cmds[13]="cd ~/Github/learning-K"
titles[13]="Learning K"

cmds[14]="cd ~/Install/strata/stoke/src/ext/x64asm"
titles[14]="Strata::x64asm"

cmds[15]="cd ~/Github/stoke"
titles[15]="Stoke::Stoke"

cmds[16]="cd ~/Github/mails/"
titles[16]="mails"

cmds[17]="cd ~/Junk"
titles[17]="Junk"

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17; do
  options+=($tab --title="${titles[i]}"  -e "bash -c \"${cmds[i]} ; bash\"" )          
done

gnome-terminal "${options[@]}"


exit 0

