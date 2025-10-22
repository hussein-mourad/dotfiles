#!/bin/bash

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd" || exit
  fi
  rm -f -- "$tmp"
}

function ex() {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
  else
    for n in "$@"; do
      if [ -f "$n" ]; then
        case "${n%,}" in
        *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
          tar xvf "$n"
          ;;
        *.lzma) unlzma ./"$n" ;;
        *.bz2) bunzip2 ./"$n" ;;
        *.rar) unrar x -ad ./"$n" ;;
        *.gz) gunzip ./"$n" ;;
        *.zip) unzip ./"$n" ;;
        *.z) uncompress ./"$n" ;;
        *.7z | *.arj | *.cab | *.chm | *.deb | *.dmg | *.iso | *.lzh | *.msi | *.rpm | *.udf | *.wim | *.xar)
          7z x ./"$n"
          ;;
        *.xz) unxz ./"$n" ;;
        *.exe) cabextract ./"$n" ;;
        *)
          echo "extract: '$n' - unknown archive method"
          return 1
          ;;
        esac
      else
        echo "'$n' - file does not exist"
        return 1
      fi
    done
  fi
}

function cdl() {
  cd "$@" && ls -al
}

function up() {
  dir=""
  if [ -z "$1" ]; then
    dir=..
  elif [[ $1 =~ ^[0-9]+$ ]]; then
    x=0
    while [ $x -lt "${1:-1}" ]; do
      dir=${dir}../
      x=$(($x + 1))
    done
  else
    dir=${PWD%/"$1"/*}/$1
  fi
  cd "$dir" || exit
}

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    [[ -z "$session" ]] && return
    sesh connect "$session"
  }
}

function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@; }

function bw() {
  # If variable is not set
  if [[ ! -v BW_SESSION ]]; then
    export BW_SESSION=$(command bw unlock --raw "$(gpg -d ~/.pass.gpg 2>/dev/null)")
  fi
  command bw "$@"
}

# Nvim switcher: switch between nvim configs
function nvims() {
  # Initialize items array with "default"
  items=("default")

  # Read the output of find into an array safely
  while IFS= read -r dir; do
    items+=("$dir")
  done < <(find ~/.config/ -maxdepth 1 \( -type d -o -type l \) -name "nvim*" -printf "%f\n" | sort)

  # Use fzf to select a config
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)

  # If nothing is selected, exit
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi

  # Launch nvim with the selected config
  NVIM_APPNAME=$config command nvim "$@"
}

function docker-homelab() {
  local oldctx
  oldctx=$(docker context show)
  docker context use homelab >/dev/null
  docker "$@"
  docker context use "$oldctx" >/dev/null
}

function colors() {
  local fgc bgc vals seq0

  printf "Color escapes are %s\n" '\e[${value};...;${value}m'
  printf "Values 30..37 are \e[33mforeground colors\e[m\n"
  printf "Values 40..47 are \e[43mbackground colors\e[m\n"
  printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

  # foreground colors
  for fgc in {30..37}; do
    # background colors
    for bgc in {40..47}; do
      fgc=${fgc#37} # white
      bgc=${bgc#40} # black

      vals="${fgc:+$fgc;}${bgc}"

      vals=${vals%%;}

      seq0="${vals:+\e[${vals}m}"
      printf "  %-9s" "${seq0:-(default)}"
      printf " ${seq0}TEXT\e[m"
      printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
    done
    echo
    echo
  done
}
