# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias h='history'

alias egrep='grep -E'

alias cdl='cd /opt/learnLinux'
alias cdo='cd /opt'
alias duhm='du -h --max-depth=1'

alias gits='git status'
alias gita='git add .'
alias gitadd='git add .'
alias gitc='git commit -m '
alias gitcm='git commit -m '
alias gitp='git push'
alias gitps='git push'
alias gitpush='git push'
alias gitpl='git pull'
alias gitpull='git pull'

alias gor='go run'

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Applications/Go
