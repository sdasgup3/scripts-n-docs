#!/bin/bash
set -exv

INSTALL_PREFIX=${HOME}/Install/llvm.release.install/
HOST_GCC=/software/gcc-5.3/
CPUS=$(nproc)
echo $HOST_GCC
cmake -DCMAKE_C_COMPILER=${HOST_GCC}/bin/gcc -DCMAKE_CXX_COMPILER=${HOST_GCC}/bin/g++ -DGCC_INSTALL_PREFIX=${HOST_GCC} -DCMAKE_CXX_LINK_FLAGS="-L${HOST_GCC}/lib64 -Wl,-rpath,${HOST_GCC}/lib64" -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DLLVM_ENABLE_ASSERTIONS=ON -DCMAKE_BUILD_TYPE="Release" -DLLVM_TARGETS_TO_BUILD="X86" ../../
make -j ${CPUS} ${VERBOSE}

# install it
rm -rf ${INSTALL_PREFIX}
make install

# we need some addl bits that are not normally installed
cp -p ../llvm/tools/clang/tools/scan-build/scan-build  ${INSTALL_PREFIX}/bin
cp -p ../llvm/tools/clang/tools/scan-build/ccc-analyzer  ${INSTALL_PREFIX}/bin
cp -p ../llvm/tools/clang/tools/scan-build/c++-analyzer  ${INSTALL_PREFIX}/bin
cp -p ../llvm/tools/clang/tools/scan-build/sorttable.js  ${INSTALL_PREFIX}/bin
cp -p ../llvm/tools/clang/tools/scan-build/scanview.css ${INSTALL_PREFIX}/bin
cp -rp ../llvm/tools/clang/tools/scan-view/*  ${INSTALL_PREFIX}/bin
