#!/usr/bin/env bash

# Custom prompt
# mReschke 2019-04-10

# At first these colors did not contain the \[ and \] which caused bash prompt mess up on long lines as it was miscounting the length of the line. See https://unix.stackexchange.com/questions/389008/bash-messed-up-display-for-long-lines
DEFAULT="\[\033[0;0m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
PURPLE="\[\033[0;35m\]"
BROWN="\[\033[0;33m\]"
GRAY="\[\033[0;37m\]"

DARKGRAY="\[\033[1;30m\]"
LIGHTBLUE="\[\033[1;34m\]"
LIGHTGREEN="\[\033[1;32m\]"
LIGHTCYAN="\[\033[1;36m\]"
LIGHTRED="\[\033[1;31m\]"
LIGHTPURPLE="\[\033[1;35m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

date="${CYAN}\D{%Y-%m-%d} ${LIGHTCYAN}\t"
user="${LIGHTPURPLE}\u${DARKGRAY}@${PURPLE}\h"
path="${DARKGRAY}in ${GREEN}\w"
#prompt1="${DARKGRAY}o"
#prompt1="${DARKGRAY}ooo"
#prompt1="${RED}o${GREEN}o${BLUE}o"
#prompt1="${DARKGRAY}o${GREEN}O${DARKGRAY}o"
#prompt1="${DARKGRAY}o${GREEN}O${DARKGRAY}o"
prompt1="${GREEN}o${DARKGRAY}o${GREEN}o"
#prompt1="${RED}o${DARKGRAY}-${GREEN}o${DARKGRAY}-${BLUE}o"
#prompt2="${BROWN} \\$ ${GREEN}→ ${DEFAULT}" # Not all terms understand this arrow
prompt2="${BROWN} \\$ ${DEFAULT}"
git="${LIGHTGREEN}"

# PS1 vs PROMPT_COMMAND?
# PS1 is a string like MyPrompt> While PROMPT_COMMAND is evaulated using bash
# In this case __git_ps1 is a bash function and all the stuff inside the "" are its parameters
# It places the actual (master) prompt AFTER the "".  This is why you see "stuff" "more stuff", the space
# in between the quoted strings is where the (master) git prompt goes

# No, hostname -f requires DNS connection, breaks bash if no internet, slow
#PROMPT_COMMAND='__git_ps1 "\n'${TITLEBAR}$DARK_BLUE'\u'$DEFAULT'@'$CYAN'$(hostname -f) '$BROWN'\w\n'$RED'CAUTION: mReschke Production!'$GREEN'" " '$CYAN'"\\\$"'$GREEN' → '$DEFAULT'"'
#PROMPT_COMMAND='__git_ps1 "\n'${TITLEBAR}$DARK_BLUE'\u'$DEFAULT'@'$CYAN'$(hostname) '$BROWN'\w\n'$RED'mreschke.net production!'$GREEN'" " '$CYAN'"\\\$"'$GREEN' → '$DEFAULT'"'
#PROMPT_COMMAND='__git_ps1 "\n'$date' '$user' in '$path'\n'$prompt'" "'$DEFAULT'"'
PROMPT_COMMAND="__git_ps1 '\n$date $user $path\n$prompt1$git' '$prompt2'"


# If you do just PS1 and no prompt_command, toor does not get a prompt
# maybe because PS1 is overwritten elsewhere down the chain?  Prompt_comman is not, so it works for all
#export PS1=$date' '$user' in '$path'\n'$prompt' $(__git_ps1 " (%s)") '
#export PS1=$date' '$user' in '$path'\n'$git' '$prompt

PS1=""
PS2='continue-> '
PS4='$0.$LINENO+ '


#  The full list comes from reading man bash, at the section PROMPTING:
# ---------------------------------------------------------------------
#   \a     an ASCII bell character (07)
#   \d     the date in "Weekday Month Date" format (e.g., "Tue May 26")
#   \D{format} the format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation.  The braces are required
#   \e     an ASCII escape character (033)
#   \h     the hostname up to the first `.'
#   \H     the hostname
#   \j     the number of jobs currently managed by the shell
#   \l     the basename of the shell's terminal device name
#   \n     newline
#   \r     carriage return
#   \s     the name of the shell, the basename of $0 (the portion following the final slash)
#   \t     the current time in 24-hour HH:MM:SS format
#   \T     the current time in 12-hour HH:MM:SS format
#   \@     the current time in 12-hour am/pm format
#   \A     the current time in 24-hour HH:MM format
#   \u     the username of the current user
#   \v     the version of bash (e.g., 2.00)
#   \V     the release of bash, version + patch level (e.g., 2.00.0)
#   \w     the current working directory, with $HOME abbreviated with a tilde (uses the value of the PROMPT_DIRTRIM variable)
#   \W     the basename of the current working directory, with $HOME abbreviated with a tilde
#   \!     the history number of this command
#   \#     the command number of this command
#   \$     if the effective UID is 0, a #, otherwise a $
#   \nnn   the character corresponding to the octal number nnn
#   \\     a backslash
#   \[     begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt
#   \]     end a sequence of non-printing characters
