#!/bin/bash

# Custom aliases
# mReschke 2017-07-11

# Better ls
alias ls='ls -AN --color=auto'
alias lsl='ls -AN --color=auto|less'
alias ll='ls -HhalN --color=auto'

# Better dir
alias dir='ls -HhalN --color=auto'
alias dirb='ls -alN --color=auto --group-directories-first'
alias dird='ls -HhalN --color=auto --group-directories-first'
alias dirg='ls -HhalN --color=auto|grep '
alias dirh='ls -HhalN --color=auto --group-directories-first --ignore=.*'
alias dirk='ls -kalN --color=auto --group-directories-first'
alias dirl='ls -halN --color=auto --group-directories-first|less'
alias dirs='ls -HhalLN --color=auto --group-directories-first'

# Better df
alias df='df -T'
alias dfh='df -h -T'
alias dfm='df -BM -T'

# Better du
alias duh='du -sh'
alias dul='du -h --max-depth=1'
alias dus='du -s'

# Better grep
alias egrep='grep -iE --color=auto'
alias fgrep='grep -iF --color=auto'
alias grep='grep -i --color=auto'
alias grep3='grep -A3 -B3 -i --color=auto'
alias igrep='grep -iv --color=auto'

# Safety
alias cp='cp --archive'
alias mv='mv -v'
alias rm='rm -Irv'

# What is my external IP address
alias whatismyip='curl -s http://icanhazip.com/'

# Python
alias pv='echo "Version:" && python --version && echo && echo "Interpreter Path:" && python -c "import sys;print(sys.prefix)" && echo && echo "Paths:" && python -c "import sys;print(sys.path);"'
alias activate='source env/bin/activate && pv'
alias pips='pipenv shell && echo "pipenv shell has been deactivated" && echo && pv'

# Docker
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dimg="docker images"
alias dimga="docker images -a"
