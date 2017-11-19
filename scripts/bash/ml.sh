LLVM_HOME=$HOME/Install/llvm.release.install
PY_HOME=$HOME/Install/Python-2.7.13.install/
LIB_FFI=$HOME/Install/libffi.install/lib/../lib64/

export PATH=${PY_HOME}/bin:$LLVM_HOME/bin:$PATH
export LD_LIBRARY_PATH=${LIB_FFI}:${PY_HOME}/lib:$LLVM_HOME/lib/:$LD_LIBRARY_PATH

export PATH="$(echo $PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"
export LD_LIBRARY_PATH="$(echo $LD_LIBRARY_PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"

echo "==================================================="
echo $PATH
echo "==================================================="
echo $LD_LIBRARY_PATH
echo "==================================================="

echo python:  $(which python) 
echo pip: $(which pip)
echo clang: $(which clang)

