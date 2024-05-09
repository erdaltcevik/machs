# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

#########################################################################################

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

alias dtp='WLR_NO_HARDWARE_CURSORS=1 sway --unsupported-gpu'

alias l='ls -Alp'
alias ll='l | less'
alias lw='ls -1Ap'
alias lt='ls -Alpt'
alias lwt='ls -1At'
alias ..='cd .. && l'

alias gn='gedit --new-window'
alias ff='firefox'

alias sshsrv='ssh erdal@srv1fdr'

alias expa='expand -t 2 '

alias ecli='cd ~/motab-sdk && . environment-setup-armv7at2hf-neon-oe-linux-gnueabi && eclipse'

#################################################
# Browser downloads directory
alias dl='cd /stor/Downloads && l'
#################################################
# /proj/
alias proj='cd /proj && l'
# /stor/ partition
alias stor='cd /stor && l'
#################################################
# motab-arago build
alias mab='cd /stor/motab-arago/build && l'
# motab-arago sources
alias mas='cd /stor/motab-arago/sources && l'
# motab-arago work
alias maw='cd /stor/motab-arago/build/arago-tmp-default-glibc/work && l'
# motab-arago dvl deploy
alias mad='cd /stor/motab-arago/build/deploy-motab/dvl && l'
#################################################
# Yocto layer for motab
alias metam='cd /proj/meta-motab && l'

#################################################
# minicom using FT232
alias mic='rm -f /home/erdal/mic.cap && sudo minicom -D /dev/ttyUSB0 -b 115200 --wrap --capturefile=/home/erdal/mic.cap'


