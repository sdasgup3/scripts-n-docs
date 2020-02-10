# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

export SVN_EDITOR=vim
LLVM_TRUNCK_HOME=$HOME/Install/llvm/llvm.4.0.0.install/
LLVM_HOME=$LLVM_TRUNCK_HOME
PIP_INSTALLS=${HOME}/.local/
OPROFILE=${HOME}/Install/oprofile.install/
IDA=${HOME}/ida-6.95/
PROTOBUF=${HOME}/Install/protobuf.install/

#################### Stoke Config ###############################################
STOKE_LIB=/home/sdasgup3/Install/boost_1_65_1/bin.v2/libs/system/build/gcc-4.9.4/debug/threading-multi/:/home/sdasgup3/Install/boost_1_65_1/bin.v2/libs/regex/build/gcc-4.9.4/release/threading-multi/:/home/sdasgup3/Install/boost_1_65_1/bin.v2/libs/filesystem/build/gcc-4.9.4/release/threading-multi/:/home/sdasgup3/Install/strata/stoke/src/ext/cvc4-1.4-build/lib/
CIRCUIT=/home/sdasgup3/Github/strata-data/circuits/
POSTGRESSSQL_LIB=/home/sdasgup3/Install/postgresql-11.4.install/lib/
POSTGRESSSQL_BIN=/home/sdasgup3/Install/postgresql-11.4.install/bin/
LIBPQXX=/home/sdasgup3/Install/libpqxx-4.0.install/lib/
export COMPD_CACHE=${HOME}/Junk/compd_cache/


################## K Config ###########################################
K_BIN=${HOME}/Github/k/k-distribution/target/release/k/bin
K_BIN=${HOME}/Github/k/k-distribution/target/release/k/bin
#K_BIN=${HOME}/Github/k5/k-distribution/target/release/k/bin
#K_BIN=${HOME}/Github/k5/k-distribution/target/release/k/bin
#K_LIB=${HOME}/Github/k5_programV_working/k-distribution/target/release/k//lib/
#K_LIB=${HOME}/Github/k5_programV_working/k-distribution/target/release/k//lib/
#
#K_BIN=${HOME}/Github/k5/k-distribution/target/release/k/bin/
#K_LIB=${HOME}/Github/k5/k-distribution/target/release/k//lib/

#K_BIN=${HOME}/Github/keq/k-distribution/target/release/k/bin/
#K_LIB=${HOME}/Github/keq/k-distribution/target/release/k//lib/
export K_OPTS=-Xmx8g
export MAVEN_OPTS=-XX:+TieredCompilation
 . /home/sdasgup3/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true


export PATH=${LLVM_HOME}/bin:${PROTOBUF}/bin:${IDA}:${K_BIN}:${OPROFILE}/bin/:${PIP_INSTALLS}/bin:$PATH
export LD_LIBRARY_PATH=${LLVM_HOME}/lib:${PROTOBUF}/lib:${K_LIB}:${PIP_INSTALLS}/lib:/usr/local/lib/:$LD_LIBRARY_PATH
export R_LIBS=${HOME}/Install/R_LIBS/
export MCSEMA_HOME=${HOME}/Github/mcsema_latest_master/
export TRAILOFBITS_LIBRARIES=/home/sdasgup3/Github/cxx-common/libraries
export LLVM_COMPILER=clang


# Git commands
git config --global user.name "Sandeep Dasgupta"
git config --global user.email "sdasgup3@illinois.edu"

# prompt
#set-title(){
## ORIG=$PS1
#  TITLE="\e]2;$@\a"
##PS1=${ORIG}${TITLE}
#}
#PS1='_____________________________________________________________________________________________________________________________________\n\W| '

function _update_ps1() {
   export PS1="$(~/scripts-n-docs/scripts/dotfiles/powerline.js $? --shell bash --depth 4)"
}
export PROMPT_COMMAND="_update_ps1"

# Nix
export NIX_PATH=${NIX_PATH}:allvm=$HOME/.nix-defexpr/channels/allvm

bind -f  ~/.inputrc

# Stoke 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${STOKE_LIB}:${POSTGRESSSQL_LIB}:${LIBPQXX}
export PATH=${POSTGRESSSQL_BIN}:$PATH

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sdasgup3/anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sdasgup3/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/home/sdasgup3/anaconda2/etc/profile.d/conda.sh"
    else
        export PATH="/home/sdasgup3/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

