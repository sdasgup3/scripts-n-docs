#!/bin/bash

ip=$1
total=0
matched=0
unmatched=0

#for ip in $(cat perf_record_100000_ips.txt); do
echo $ip
echo ====
if grep --quiet $ip report.txt; then
  echo "  Matched"
  grep "$ip:" topdown_parser.objdump
  matched=$((matched+1))
else
  echo "  UnMatched"
  grep "$ip:" topdown_parser.objdump
  unmatched=$((unmatched+1))
fi
#done


#echo $total
#echo $matched
#echo $unmatched
