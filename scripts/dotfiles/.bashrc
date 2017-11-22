# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

export SVN_EDITOR=vim
LLVM_TRUNCK_HOME=$HOME/Install/llvm.release.install
LLVM_HOME=$LLVM_TRUNCK_HOME
PIP_INSTALLS=${HOME}/.local/
OPROFILE=${HOME}/Install/oprofile.install/
K=${HOME}/Github/k/k-distribution/target/release/k/
IDA=${HOME}/ida-6.95/

export PATH=${IDA}:${K}/bin/:${OPROFILE}/bin/:${PIP_INSTALLS}/bin:${LLVM_HOME}/bin:$PATH
export LD_LIBRARY_PATH=${K}/lib:${OPROFILE}/lib/:${PIP_INSTALLS}/lib:${LLVM_HOME}/lib:/usr/local/lib/:$LD_LIBRARY_PATH
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
