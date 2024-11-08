## Zsh Configuration File
# Requirements: git, wget, curl, fzf, zoxide, neovim
# Based on: https://github.com/dreamsofautonomy/zensh


# ---------- POWERLEVEL10K INSTANT PROMPT ----------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------- ENVIRONMENT VARIABLES ----------
source ~/.profile

# Directory for Zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Paths for Zsh completions
fpath=(
  /usr/local/share/zsh/site-functions
  /usr/share/zsh/site-functions
  /usr/share/zsh/functions/Completion
  /usr/share/zsh/functions/Completion/Linux
  $fpath
)

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# ---------- ZINIT PLUGINS ----------
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1;zinit light jeffreytse/zsh-vi-mode
zinit light Aloxaf/fzf-tab

# Atuin install
# line 1: `atuin` binary as command, from github release, only look at .tar.gz files, use the `atuin` file from the extracted archive
# line 2: setup at clone(create init.zsh, completion)
# line 3: pull behavior same as clone, source init.zsh
# zinit ice as"command" from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" \
#     atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
#     atpull"%atclone" src"init.zsh"
# zinit light atuinsh/atuin

# ---------- ZINIT SNIPPETS ----------
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
# zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::command-not-found

# ---------- COMPLETION SETTINGS ----------
# Load completions
autoload -Uz compinit && compinit
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# zinit cdreplay -q


# ---------- HISTORY CONFIGURATION ----------
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
HISTORY_IGNORE="ls:cd:cd -:cd ..:cd ~:pwd:exit:clear"
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


source ~/.bash_aliases
source ~/.bash_functions
# source ~/bin/nvim-switcher

# ---------- KEYBINDINGS ----------
# bindkey -e # emacs mode
bindkey -v # Enable vim mode
bindkey -M vicmd '^p' history-search-backward
bindkey -M vicmd '^n' history-search-forward
bindkey -M vicmd '^[w' kill-region
bindkey -M vicmd "^X^E" edit-command-line

# ---------- COLOR SETTINGS ----------
# Remove Background colors
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

# ---------- FZF CONFIGURATION ----------
# Custom Catppuccin Dark theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#222222,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# ---------- SHELL INTEGRATIONS ----------
# source /usr/share/nvm/init-nvm.sh

# if commond -v pyenv 1>/dev/null 2>&1; then
  # eval "$(pyenv init -)"
# fi

# eval "$(starship init zsh)"
# setopt noglob

# bun completions
# [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Define a function to activate venv if present
# venv_auto_activate() {
#     if [[ -d "venv" ]]; then
#         # Check if already activated to avoid redundant activation
#         if [[ -z "${VIRTUAL_ENV}" ]]; then
#             source venv/bin/activate
#         fi
#     fi
# }

# Hook function to activate venv_auto_activate when changing directories
# chpwd_functions+=venv_auto_activate

# Load argcomplete
# eval "$(register-python-argcomplete)"

# Shell integrations
eval "$(fzf --zsh)"
# Replace the default cd command with zoxide
# eval "$(zoxide init --cmd cd zsh)"
eval "$(zoxide init zsh)"

# eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

# venv_auto_activate

# eval "$(uv generate-shell-completion zsh)"
eval "$(direnv hook zsh)"

. /opt/asdf-vm/asdf.sh

# ---------- PATH & PROGRAM SETTINGS ----------
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
