#!/bin/bash

PROG=$1

execute() {
  echo
  echo "$1"
  #$1
}


if [ "$PROG" == "" ]; then
  exit 1
fi

ps axf | grep ${PROG}  | grep -v grep | awk '{print "perf record -a -c 100000  -d --pfm-events '\''{MEM_UOPS_RETIRED:all_loads:precise=2,mem_uops_retired:all_stores:precise=2}'\'' -i -m 16 -N -p " $1}'
