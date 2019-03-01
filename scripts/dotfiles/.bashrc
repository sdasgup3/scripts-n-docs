# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

export SVN_EDITOR=vim
LLVM_TRUNCK_HOME=$HOME/Install/llvm.debug.install
LLVM_HOME=$LLVM_TRUNCK_HOME
PIP_INSTALLS=${HOME}/.local/
OPROFILE=${HOME}/Install/oprofile.install/
IDA=${HOME}/ida-6.95/
PROTOBUF=${HOME}/Install/protobuf.install/

#################### Stoke Config ###############################################
STOKE_LIB=/home/sdasgup3/Install/boost_1_65_1/bin.v2/libs/system/build/gcc-4.9.4/debug/threading-multi/:/home/sdasgup3/Install/boost_1_65_1/bin.v2/libs/regex/build/gcc-4.9.4/release/threading-multi/:/home/sdasgup3/Install/boost_1_65_1/bin.v2/libs/filesystem/build/gcc-4.9.4/release/threading-multi/:/home/sdasgup3/Install/strata/stoke/src/ext/cvc4-1.4-build/lib/
CIRCUIT=/home/sdasgup3/Github/strata-data/circuits/
################## K Config ###########################################
#K_BIN=${HOME}/Github/k/k-distribution/target/release/k/bin:${HOME}/Github/k/k-distribution/target/release/k/lib/native/linux
#K_LIB=${HOME}/Github/k/k-distribution/target/release/k//lib/native/linux64/:${HOME}/Github/k/k-distribution/target/release/k//lib/
K_BIN=${HOME}/Github/k5/k-distribution/target/release/k/bin/
K_LIB=${HOME}/Github/k5/k-distribution/target/release/k//lib/
export K_OPTS=-Xmx8g
export MAVEN_OPTS=-XX:+TieredCompilation
 . /home/sdasgup3/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true


export PATH=${PROTOBUF}/bin:${IDA}:${K_BIN}:${OPROFILE}/bin/:${PIP_INSTALLS}/bin:$PATH
export LD_LIBRARY_PATH=${PROTOBUF}/lib:${K_LIB}:${PIP_INSTALLS}/lib:/usr/local/lib/:$LD_LIBRARY_PATH
export R_LIBS=${HOME}/Install/R_LIBS/
export MCSEMA_HOME=${HOME}/Github/mcsema_latest_master/
export TRAILOFBITS_LIBRARIES=/home/sdasgup3/Github/cxx-common/libraries


# Git commands
git config --global user.name "Sandeep Dasgupta"
git config --global user.email "sdasgup3@illinois.edu"

# prompt
set-title(){
# ORIG=$PS1
  TITLE="\e]2;$@\a"
#PS1=${ORIG}${TITLE}
}
PS1='_____________________________________________________________________________________________________________________________________\n\W| '

# Nix
export NIX_PATH=${NIX_PATH}:allvm=$HOME/.nix-defexpr/channels/allvm

bind -f  ~/.inputrc

# Stoke 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${STOKE_LIB}

# Pretty Display
export PATH="$(echo $PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"
export LD_LIBRARY_PATH="$(echo $LD_LIBRARY_PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"

whoami| figlet
ssh-add ~/.ssh/githubkey_rsa
ssh-add ~/.ssh/gitlab.key_rsa
echo "=================================================="
echo $PATH
echo "=================================================="
echo $LD_LIBRARY_PATH
echo "=================================================="
whoami| figlet

#ssh -X sdasgup3@tyler.cs.illinois.edu
