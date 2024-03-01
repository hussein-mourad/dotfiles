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
export DATA_ROOT='/mnt/d/linux'
export DESKTOP="$DATA_ROOT/Desktop"
export DOCUMENTS="$DATA_ROOT/Documents"
export DOWNLOADS="$DATA_ROOT/Downloads"
export PICTURES="$DATA_ROOT/Pictures"
export VIDEOS="$DATA_ROOT/Videos"
export MUSIC="$DATA_ROOT/Music"
export UNI='/mnt/d/college/term9'
export WORK='/mnt/work'

# clear
alias c='clear'

# vim
alias vi="NVIM_APPNAME=nvim-astro command nvim"
alias nvim="NVIM_APPNAME=nvim-astro command nvim"

alias vimc="vi ~/.vimrc"
alias nvimc="cd ~/.config/nvim-astro/lua/user && vi . && cd - "
alias nvchadc="cd ~/.config/nvim-chad && vi && cd - "

# ls
alias ll='ls -lhF'
alias la='ls -Ahl'
alias lsl='ls -ahl | less'
alias l='ls -ChF'
alias l.='ls -hd .*'

# cd
alias cd..='cd ..' # Get rid of command not found
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# mkdir
alias mkdir='mkdir -pv'

# rsync
alias rsync='rsync --progress -ravz'

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
# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Add safety
alias rm="rm -i --preserve-root"
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Parenting changing perms on / #
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
alias ff4='/opt/firefox4/firefox'
alias ff13='/opt/firefox13/firefox'
alias chrome='/opt/google/chrome/chrome'
alias opera='/opt/opera/opera'
#default ff
alias ff=ff13
#my default browser
alias browser=firefox

# git
alias gaf='git add -f'

# netowrking
alias ping='ping -c 5'
alias fastping='ping -c 100 -s .2'

# navigation
alias java16="export JAVA_HOME=/home/hussein/Downloads/jdk-16.0.1/bin/;export PATH=$PATH:$JAVA_HOME"
alias backup="cd /mnt/d/linux/Downloads/fresh_linux_install"
alias work="/mnt/work"

# package manager
#alias q='apt search'
#alias i='sudo apt install'
#alias u="sudo apt update && sudo apt upgrade -y && sudo snap refresh"
#alias r='sudo apt remove'
alias q='pacman -Ss'
alias i='sudo pacman -S'
alias u="sudo pacman -Syu"
alias r='sudo pacman -Rsc'

# file shortcut
alias bashrc="vi ~/.bashrc && source ~/.bashrc"
alias aliases="vi ~/.bash_aliases && source ~/.bash_aliases"
alias functions="vi ~/.bash_functions && source ~/.bash_functions"
alias zshc="vi ~/.zshrc && zsh"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias i3c="vi ~/.config/i3/config"
#alias i3blocksc="vi ~/.config/i3/i3blocks.conf"
alias tmuxc="vi ~/.config/tmux/tmux.conf && tmux source-file ~/config/tmux/tmux.conf "
alias azkar='nohup zathura --page=54 /mnt/d/linux/Documents/books/islam/hisn-al-muslim.pdf > /dev/null 2>&1  &'

# folder shortcut
alias term10='cd /mnt/d/college/term10/'
alias dotfiles='cd ~/dotfiles'

# commands enhancement
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
