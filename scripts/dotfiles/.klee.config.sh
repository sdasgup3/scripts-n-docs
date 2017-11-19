set +x

STP=${HOME}/Install/stp.install
LLVM_3_8_HOME=$HOME/Install/llvm-3.8.release.install
LLVM_HOME=${LLVM_3_8_HOME}
KLEE=${HOME}/Install/klee.install/

PATH=${LLVM_HOME}/bin:${STP}/bin:${KLEE}/bin:$PATH
LD_LIBRARY_PATH=${LLVM_HOME}/lib:${STP}/lib:${KLEE}/lib:$LD_LIBRARY_PATH
export PATH
export LD_LIBRARY_PATH

ulimit -s unlimited


export PATH="$(echo $PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"
export LD_LIBRARY_PATH="$(echo $LD_LIBRARY_PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"

echo "PATH : "  $PATH
echo "LD_LIBRARY_PATH : "  $LD_LIBRARY_PATH
echo "which stp : " $(which stp)
echo "which clang : " $(which clang)
echo "which clang++ : " $(which clang++)
echo "which klee : " $(which klee)
