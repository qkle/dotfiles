#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

###############################################################################
####################### COLOR PROMPT CONFIGURE ################################
###############################################################################
# Special Characters:
#	\h	the hostname up to the first "."
#	\n	new line
#	\s	the name of the shell
#	\t	the current time in 24-hour format
#	\u	the username of the current user
#	\w	the current working directory
#	\W	the basename of the current working directory
#	\[ \]	Wrapping commands between these special escapes for proper cursor

# My promt preset
# https://www.youtube.com/watch?v=LXgXV7YmSiU&list=PL-osiE80TeTvGhHkpvfmKWOiIPF8UVy6c&index=9
reset="\033[00m"

# Colors
# https://opensource.com/article/19/9/linux-terminal-colors
gray="\033[30m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
purple="\033[35m"
teal="\033[36m"
white="\033[37m"

# Styles
# https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
bold="\033[01m"
italic="\033[03m"
underline="\033[04m"
slow_blink="\033[05m"
rapid_blink="\033[06m"
cross_out="\033[09m"

if [ "$color_prompt" = yes ]; then
    PS1="\[${bold}\]"
    PS1+="\[${red}\]\u"		# username
    PS1+="\[${gray}\]@"
    PS1+="\[${yellow}\]\h"		# hostname
    PS1+="\[${teal}\] \w"		# current working directory
    PS1+="\[${white}\]\n"
    PS1+="$ "
    PS1+="\[${reset}\]"
else
    PS1='\u@\h:\w\n$ '
fi
unset color_prompt force_color_prompt
###############################################################################
######################## END COLOR PROMPT CONFIGURE ###########################
###############################################################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias up='sudo pacman -Syu'
