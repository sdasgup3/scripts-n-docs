#!/bin/bash

export  SPEC_SRC=/home/sdasgup3/Github/speccpu2006/
export  LLVM_SRC=/home/sdasgup3/Install/llvm
export  LLVM_BLD=/home/sdasgup3/Install/llvm/build/Debug
export  TESTSUITE_BUILD_DIR=/home/sdasgup3/Github/LLVMProfiler/test-suite-build/ 

mkdir -p $LLVM_SRC/projects/test-suite-externals
mkdir -p ${TESTSUITE_BUILD_DIR}

ln -s $SPEC_SRC $LLVM_SRC/projects/test-suite-externals/speccpu2006
cd ${TESTSUITE_BUILD_DIR} 
CC=gcc CXX=g++  ${LLVM_SRC}/projects/test-suite/configure --with-llvmsrc=${LLVM_SRC} --with-llvmobj=${LLVM_BLD} 
