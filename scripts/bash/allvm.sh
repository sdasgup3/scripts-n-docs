LLVM_TRUNCK_HOME=$HOME/Install/llvm.release.install
LLVM_HOME=$LLVM_TRUNCK_HOME
WLLVM=${HOME}/Github/whole-program-llvm
ALLVM=${HOME}/allvm-umbrella/allvm/build/

export PATH=${ALLVM}/bin:${WLLVM}:$LLVM_HOME/bin:$PATH
export LD_LIBRARY_PATH=$LLVM_TRUNCK_HOME/lib/:$LD_LIBRARY_PATH

export PATH="$(echo $PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"
export LD_LIBRARY_PATH="$(echo $LD_LIBRARY_PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"

echo "==================================================="
echo $PATH
echo "==================================================="
echo $LD_LIBRARY_PATH
echo "==================================================="
