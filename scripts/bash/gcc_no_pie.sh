#!/bin/bash

#gcc -no-pie -DWITHGPERFTOOLS -I /home/sdasgup3/Install/gperftools.install/include/ -L/home/sdasgup3/Install/gperftools.install/lib $@ -lprofiler 
gcc -no-pie -g -pg  $@ 
