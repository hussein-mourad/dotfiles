#!/bin/bash

# Notes:
# How to disable alias temporarily
# full path, ex:
# /usr/bin/clear
# backslash, ex:
# \c
# command, ex:
# command clear
# unalias, ex:
# unalias c

# Environment Variables
export DATA_ROOT='/mnt/d/data'
export DESKTOP="$HOME/data/desktop"
export DOCUMENTS="$DATA_ROOT/documents"
export DOWNLOADS="$DATA_ROOT/downloads"
export PICTURES="$DATA_ROOT/media/pictures"
export VIDEOS="$DATA_ROOT/media/videos"
export MUSIC="$DATA_ROOT/media/music"

# colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# clear
alias c='clear'

# vim
alias v="nvim"
alias vi="nvim"
# alias nvim="NVIM_APPNAME=nvim-astro command nvim"
# alias nvimv4="NVIM_APPNAME=astronvim-v4 command nvim"

# alias vimc="vi ~/.vimrc"
alias nvimc="cd ~/.config/nvim && vi . && cd - "
# alias nvchadc="cd ~/.config/nvim-chad && vi && cd - "

# ls
alias l='ls -ChF'
alias l.='ls -hd .*'
alias ll='ls -lhF'
alias la='ls -Ahl'
alias lsl='ls -ahl | less'

# cd
alias cd..='cd ..' # Get rid of command not found
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

alias mkdir='mkdir -pv'
alias rmdir='rmdir -pv'

alias rsync='rsync -avhz --progress --stats'

## ssh
alias sshk="eval \$(ssh-agent -s) && ssh-add ~/.ssh/id_ed25519"
# calculator
alias bc='bc -l'

# mount
alias mountt='mount | column -t'

# shortcuts
alias h='history'
alias j='jobs -l'

# commands
alias path='echo -e ${PATH//:/\\n}' # Print $PATH in a neat way
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
# add an "alert" alias for long running commands.  use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# add safety
alias rm="rm -vi --preserve-root"
alias mv='mv -vi'
alias cp='cp -vi'
alias ln='ln -vi'

# parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# if user is not root, pass all commands via sudo
# reboot / halt / poweroff / shutdown
if [ $UID -ne 0 ]; then
	alias reboot='sudo /sbin/reboot'
	alias poweroff='sudo /sbin/poweroff'
	alias halt='sudo /sbin/halt'
	alias shutdown='sudo /sbin/shutdown'
fi

# reports
alias meminfo='free'
# get top process eating cpu
alias psmem='ps auxf | sort -nr -k 4'
alias psmem5='ps auxf | sort -nr -k 4 | head -10'
# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
# Get server cpu info
alias cpuinfo='lscpu'
# older system use /proc/cpuinfo
#alias cpuinfo='less /proc/cpuinfo'
# get GPU ram on desktop / laptop
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# Ranger
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# wget
alias wget='wget -c' # continue by default

# browsers
# alias ff4='/opt/firefox4/firefox'
# alias ff13='/opt/firefox13/firefox'
# alias chrome='/opt/google/chrome/chrome'
# alias opera='/opt/opera/opera'
#default ff
# alias ff=ff13
#my default browser
alias browser=firefox

# git
alias gaf='git add -f'
alias lg='lazygit'

# netowrking
alias ping='ping -c 5'
alias fastping='ping -c 100 -s .2'

# package manager
#alias q='apt search'
#alias i='sudo apt install'
#alias u="sudo apt update && sudo apt upgrade -y && sudo snap refresh"
#alias r='sudo apt remove'
alias q='pacman -Ss'
alias i='sudo pacman -S'
alias u="sudo pacman -Syu"
alias r='sudo pacman -Rsc'

# commands enhancement (modern unix tools)
if [ -x "$(command -v lsd)" ]; then
	alias ls="lsd"
	alias lt="lsd --tree"
fi
if [ -x "$(command -v dust)" ]; then
	alias du="dust"
fi
if [ -x "$(command -v duf)" ]; then
	alias df="duf"
fi
if [ -x "$(command -v bat)" ]; then
	alias cat="bat"
fi

alias za="zathura"
alias pdf="zathura"

# file shortcut
alias bashrc="vi ~/.bashrc && source ~/.bashrc"
alias aliases="vi ~/.bash_aliases && source ~/.bash_aliases"
alias functions="vi ~/.bash_functions && source ~/.bash_functions"
alias zshc="vi ~/.zshrc && zsh"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias i3c="vi ~/.config/i3/config"
alias i3blocksc="vi ~/.config/i3/i3blocks.conf"
alias tmuxc="vi ~/.config/tmux/tmux.conf && tmux source-file ~/.config/tmux/tmux.conf "
alias azkar='nohup zathura --page=54 /mnt/d/data/documents/books/islam/hisn-al-muslim.pdf > /dev/null 2>&1  &'

# directory shortcut
alias term10='cd /mnt/d/data/college/term10/'
alias dotfiles='cd ~/dotfiles'

# functions
alias homelab-battery="ssh homelab upower -i /org/freedesktop/UPower/devices/battery_BAT1"

alias notes="cd /mnt/d/data/documents/notes/ && vi ."
