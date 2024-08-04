# Make sure to have the following packages installed:
# git wget curl fzf zxoide neovim
# This config is based on: https://github.com/dreamsofautonomy/zensh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.profile

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

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

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1;zinit light jeffreytse/zsh-vi-mode
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
# zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

# zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# History
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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
# Replace the default cd command with zoxide
# eval "$(zoxide init --cmd cd zsh)"
eval "$(zoxide init zsh)"

source ~/.bash_aliases
source ~/.bash_functions
# source ~/bin/nvim-switcher

# Keybindings
# bindkey -e # emacs mode
bindkey -v # vim mode
bindkey -M vicmd '^p' history-search-backward
bindkey -M vicmd '^n' history-search-forward
bindkey -M vicmd '^[w' kill-region

# Remove Background colors
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

# Catppuccin Mocha
# https://github.com/catppuccin/fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#111111,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# source /usr/share/nvm/init-nvm.sh

# if commond -v pyenv 1>/dev/null 2>&1; then
  # eval "$(pyenv init -)"
# fi

# eval "$(starship init zsh)"
# setopt noglob

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Define a function to activate venv if present
venv_auto_activate() {
    if [[ -d "venv" ]]; then
        # Check if already activated to avoid redundant activation
        if [[ -z "${VIRTUAL_ENV}" ]]; then
            source venv/bin/activate
        fi
    fi
}

# Hook function to activate venv_auto_activate when changing directories
chpwd_functions+=venv_auto_activate


# if commond -v rbenv 1>/dev/null 2>&1; then
#   eval "$(rbenv init -)"
# fi
eval "$(rbenv init -)"

# Load argcomplete
# eval "$(register-python-argcomplete)"
