# Files .bash_profile
alias cl='clear;echo "";'
alias h='history'
alias sss='. ~/.profile'
export EDITOR=/usr/bin/vi
export HISTSIZE=2000
export HISTFILESIZE=2000
export LFS=/mnt/lfs
export PS1='\u:\w\$ '
export MAKEFLAGS='-j6'
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
