#!/bin/bash

sudo perf record  --all-cpus --timestamp-filename    --output=prof.data --freq=10000 -- ${HOME}/Install/llvm.debug.install/bin/clang++  $@
