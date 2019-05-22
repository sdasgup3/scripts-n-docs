#!/bin/bash
# downloads and decompresses llvm+clang
# the tarballs and the toplevel dir llvm-<version>.src are stored in the given
# local path
# usage: download-llvm.sh [llvm version (e.g. 3.7.1)] [local path (e.g. ~/llvm)] [fast|full]

llvm_src=llvm-$1.src
clang_src=cfe-$1.src
lld_src=lld-$1.src
polly_src=polly-$1.src
compilerrt_src=compiler-rt-$1.src
clangextra_src=clang-tools-extra-$1.src
testsuite_src=test-suite-$1.src
openmp_src=openmp-$1.src

llvm_tar=${llvm_src}.tar.xz
clang_tar=${clang_src}.tar.xz
lld_tar=${lld_src}.tar.xz
polly_tar=${polly_src}.tar.xz
compilerrt_tar=${compilerrt_src}.tar.xz
clangextra_tar=${clangextra_src}.tar.xz
testsuite_tar=${testsuite_src}.tar.xz
openmp_tar=${openmp_src}.tar.xz

llvm_url_prefix=http://llvm.org/releases/$1
llvm_url=${llvm_url_prefix}/${llvm_tar}
clang_url=${llvm_url_prefix}/${clang_tar}
lld_url=${llvm_url_prefix}/${lld_tar}
polly_url=${llvm_url_prefix}/${polly_tar}
compilerrt_url=${llvm_url_prefix}/${compilerrt_tar}
clangextra_url=${llvm_url_prefix}/${clangextra_tar}
testsuite_url=${llvm_url_prefix}/${testsuite_tar}
openmp_url=${llvm_url_prefix}/${openmp_tar}

initdir=`pwd`
mkdir -p $2
cd $2
llvmdir=`pwd`

wgetversion=`wget --version | grep -E -o "[0-9]+\.[0-9]+"`
if [[ "${wgetversion}" = `echo -e "1.16\n${wgetversion}" | sort -V | head -n1` ]];
  then wgetopts="-v"
  else wgetopts="-q --show-progress"
fi

echo "Downloading ..."

if [ -e "${llvm_tar}" ] ; then
echo "${llvm_tar} exists"
else
wget ${wgetopts} ${llvm_url}
fi

if [ -e "${clang_tar}" ] ; then
echo "${clang_tar} exists"
else
wget ${wgetopts} ${clang_url}
fi

if [ -e "${compilerrt_tar}" ] ; then
echo "${compilerrt_tar} exists"
else
wget ${wgetopts} ${compilerrt_url}
fi

if [ -e "${testsuite_tar}" ] ; then
echo "${testsuite_tar} exists"
else
wget ${wgetopts} ${testsuite_url}
fi

if [ "$3" != "fast" ]; then
  if [ -e "${lld_tar}" ] ; then
  echo "${lld_tar} exists"
  else
  wget ${wgetopts} ${lld_url}
  fi

  if [ -e "${polly_tar}" ] ; then
  echo "${polly_tar} exists"
  else
  wget ${wgetopts} ${polly_url}
  fi

  if [ -e "${clangextra_tar}" ] ; then
  echo "${clangextra_tar} exists"
  else
  wget ${wgetopts} ${clangextra_url}
  fi

  if [ -e "${openmp_tar}" ] ; then
  echo "${openmp_tar} exists"
  else
  wget ${wgetopts} ${openmp_url}
  fi
fi

echo "Decompressing ..."
tar xf ${llvm_tar}

cd ${llvmdir}/${llvm_src}/projects

tar xf ${llvmdir}/${compilerrt_tar}
mv ${compilerrt_src} compiler-rt

tar xf ${llvmdir}/${testsuite_tar}
mv ${testsuite_src} test-suite

if [ "$3" != "fast" ]; then
  tar xf ${llvmdir}/${openmp_tar}
  mv ${openmp_src} openmp
fi

cd ${llvmdir}/${llvm_src}/tools

tar xf ${llvmdir}/${clang_tar}
mv ${clang_src} clang

if [ "$3" != "fast" ]; then
  tar xf ${llvmdir}/${lld_tar}
  mv ${lld_src} lld

  tar xf ${llvmdir}/${polly_tar}
  mv ${polly_src} polly

  cd ${llvmdir}/${llvm_src}/tools/clang/tools

  tar xf ${llvmdir}/${clangextra_tar}
  mv ${clangextra_src} extra
fi

cd ${initdir}

echo "Done."

