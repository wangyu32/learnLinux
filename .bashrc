# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias h='history'
alias cdl='cd /opt/learnLinux'
alias cdo='cd /opt'
alias duhm='du -h --max-depth=1'


alias gits='git status'
alias gitadd='git add .'
alias gitcm='git commit -m '

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Applications/Go
