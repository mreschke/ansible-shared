# Manange Bash History ~/.bash_history

# Unlimited HISTSIZE and HISTFILESIZE
export HISTSIZE=
export HISTFILESIZE=

# Don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

# Ignore commands
export HISTIGNORE="ls:dir:exit:sudo ls -Hhal"

# Time only shows up in 'history' command, and uses comments in actual ~/.bash_history file
# NO, default is fine...export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
