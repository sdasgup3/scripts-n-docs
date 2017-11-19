
if [ "$1" == "unset" ] ; then 
  echo "                       Unsetting BIN DECOMP variables"
  unset MCSEMA_HOME 
  unalias  clang-3.8
  unalias  clang++-3.8
  
  PATH=$(echo "$PATH" | sed -e 's/\/home\/sdasgup3\/Install\/protobuf.install\/bin[:]*//g' | sed -e 's/\/home\/sdasgup3\/Install\/configureBased/\/llvm-3.8.release.install\/bin[:]*//g' | sed -e 's/\/home\/sdasgup3\/\.nix-profile\/bin[:]*//g' | sed -e 's/\/home\/sdasgup3\/\.nix-profile\/sbin[:]*//g')
  export PATH

  LD_LIBRARY_PATH=$(echo "$LD_LIBRARY_PATH" | sed -e 's/\/home\/sdasgup3\/Install\/protobuf.install\/lib[:]*//g' | sed -e 's/\/home\/sdasgup3\/Install\/configureBased/\/llvm-3.8.release.install\/lib[:]*//g')
  export LD_LIBRARY_PATH

  echo "PATH : "  $PATH
  echo 
  echo "LD_LIBRARY_PATH : "  $LD_LIBRARY_PATH
  echo 
  echo clang:  $(which clang) 
  echo 
  echo clang:  $(which clang++) 
  echo 
  echo idal: $(which idal)
  echo 
  echo protoc: $(which protoc)
  echo 
  alias clang-3.8
  echo 
  alias clang++-3.8
  echo 
  echo clang:  $(which protoc) 
  echo 
  echo MCSEMA_HOME:  ${MCSEMA_HOME}
  echo 
  return 
fi


. /home/sdasgup3/.nix-profile/etc/profile.d/nix.sh
LLVM_3_8_0_HOME=$HOME/Install/configureBased//llvm-3.8.release.install
LLVM_HOME=${LLVM_3_8_0_HOME}
IDA=${HOME}/.nix-profile
PROTOC=$HOME/Install/protobuf.install

export MCSEMA_HOME=${HOME}/Github/mcsema_latest_stack_public_master_merge/build/

export PATH=${IDA}/bin:${PROTOC}/bin:$LLVM_HOME/bin:$PATH
export LD_LIBRARY_PATH=${PROTOC}/lib:$LLVM_HOME/lib:$LD_LIBRARY_PATH

export PATH="$(echo $PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"
export LD_LIBRARY_PATH="$(echo $LD_LIBRARY_PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"

alias clang-3.8=${LLVM_3_8_0_HOME}/bin/clang
alias clang++-3.8=${LLVM_3_8_0_HOME}/bin/clang++

echo "PATH : "  $PATH
echo 
echo "LD_LIBRARY_PATH : "  $LD_LIBRARY_PATH
echo 
echo clang:  $(which clang) 
echo 
echo clang:  $(which clang++) 
echo 
echo idal: $(which idal)
echo 
echo protoc: $(which protoc)
echo 
alias clang-3.8
echo 
alias clang++-3.8
echo 
echo clang:  $(which protoc) 
echo 
echo MCSEMA_HOME:  ${MCSEMA_HOME}
echo 

#LIBFFI_HOME=${HOME}/Documents/libffi.inst
#ALLIN_HOME=${HOME}/Github/binary-decompilation/build/
#export ALLVM=/nix/store/fznh5vgj1yjfvykwjrl3i9by4h58k0zk-allvm-tools/
#export ALLVM=/nix/store/qdksdczw1f3kl0b2vjbj0l45fdywih7k-allvm-tools
#export LIBNONE=${ALLVM}/lib/libnone.a
#export LD_LIBRARY_PATH=$LLVM_HOME/lib/:$LIBFFI_HOME/lib64:$LD_LIBRARY_PATH


