#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
[[ $DISPLAY ]] && shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

set_prompt () {
    Last_Command=$?
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'

    # Add a bright white exit status for the last command
    PS1="$White\$? "

    # If it was successful, print a green check mark. Otherwise, print a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi

    # If root, just print the host in red. Otherwise, print the current user and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi

    # Print the working directory and prompt marker in blue, and reset the text color to the default.
    PS1+="$Blue\\w \\\$$Reset "
}

PROMPT_COMMAND='set_prompt'

alias l='ls -Alp'
alias ll='l | less'
alias lw='ls -1Ap'

alias ..='cd .. && l'
#################################################
# DVL partition
alias dvl='cd /dvl && l'
# SRC partition
alias src='cd /src && l'
#################################################
# Development directory for "motab"
alias mt='cd /dvl/motab && l'
# Buildroot output dir
alias mto='cd /src/motab_out && l'

# Development directory for "Beaglebone Black"
alias bbb='cd /dvl/bbb && l'
# Development directory for "Beaglebone Green"
alias bbg='cd /dvl/bbg && l'
# Buildroot output dir
alias bbgo='cd /src/bbg_out && l'
#################################################
# U-Boot source dir
alias ubs='cd /src/motab-ubs && l'
# U-Boot source dir - original
alias ubso='cd /src/motab-ubso && l'
# U-Boot source dir - non-pruned (full)
alias ubsf='cd /src/motab-ubsf && l'
# U-Boot source output dir
alias ubo='cd /src/motab-ubo && l'
#################################################
# ti-linux source dir
alias lis='cd /src/ti-linux && l'
# ti-linux build dir
alias lio='cd /src/ti-linux_out && l'
#################################################
# Buildroot source dir
alias br='cd /src/buildroot && l'
#################################################
# crosstool-ng source dir
alias ct='cd /src/crosstool-ng && l'
#################################################
# Qt5 source dir
alias qts='cd /src/qts && l'
# Qt5 build dir
alias qtb='cd /src/qtb && l'
# Qt5 target dir
alias qtt='cd /src/qtt && l'
# Qt5 host dir
alias qth='cd /src/qth && l'
# QtCreator IDE
alias qt='qtcreator'
#################################################
# Poky work dir
alias pk='cd /src/poky && l'
#################################################
# TISDK build dir
alias tb='cd /src/tisdk/build && l'
# TISDK sources dir
alias ts='cd /src/tisdk/sources && l'
#################################################

# Project Saymon directory
alias sy='cd /dvl/saymon && l'
# Project Silmon directory
alias sl='cd /dvl/silmon && l'
#################################################
# RAID view status
alias mds='sudo mdadm --detail /dev/md127'
#################################################
# minicom command alias
alias mic='rm -f /home/erdal/minicom.cap && sudo minicom --wrap --capturefile=/home/erdal/minicom.cap'
#################################################
# Browser downloads directory
alias dl='cd /src/Downloads && l'

