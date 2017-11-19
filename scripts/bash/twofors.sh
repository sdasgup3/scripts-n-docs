#!/bin/bash


IFS=$'\n' read -d '' -r -a lines1 < fileList.txt
IFS=$'\n' read -d '' -r -a lines2 < ~/Junk/x
im2_files=$(cat ~/Junk/x)

for ((i=1,j=1;i<=140, j<= 140;i++,j++)); do    
  echo " ${lines1[$i]},${lines2[$j]}"; 
done

