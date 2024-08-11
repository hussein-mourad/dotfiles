# Dotfiles

This directroy contains the dotfiles for my system
It is inspired by this [video](https://www.youtube.com/watch?v=y6XCebnB9gs)

## Requirements

Ensure that you have these packages installed on your system

- git
- stow

## Installation

Clone the repo locally

```bash
git clone https://github.com/Hussein-Mourad/dotfiles.git
cd dotfiles
```

Create symlinks using GNU stow

```bash
stow --adapt .
git restore .
```

## Backup Packages

```bash
yay -Qq > .pkgslist.txt
yay -Qqe > .pkgslist-explicit.txt
pip list > .piplist.txt
pipx list --short > .pipxlist.txt
```

cronjob

```bash
* */2 * * * yay -Qq > $HOME/dotfiles/.pkgslist.txt # every 2 hours
* */2 * * * yay -Qeq > $HOME/dotfiles/.pkgslist.explicit.txt
* */3 * * * pip list > $HOME/dotfiles/.piplist.txt
* */3 * * * pipx list --short > $HOME/dotfiles/.pipxlist.txt
```

## Change Theme checklist

- [ ] i3 Configuration, Path: `~/.config/i3/`
- [ ] i3status or i3blocks Configuration
- [ ] i3lock Configuration `~/.local/bin/lockscreen`
- [ ] Xresources file
- [ ] dunst Configuration
- [ ] rofi Configuration
- [ ] dmenu `.dmenurc` or rofi
- [ ] Terminals Configuration (konsole, xfce4-terminal, alacritty, kitty)
- [ ] tmux Configuration
- [ ] neovim Configuration
- [ ] fzf in zshrc
- [ ] zathura Configuration
- [ ] yazi Configuration
- [ ] bat Configuration
- [ ] change wallpaper
- [ ] GTK/QT Applications

# TODO

- [ ] Configure nvim from scartch to avoid depending on an external distro

## Notes

updating catppuccin theme

```bash
cd ~/.local/share/themes

# Set the root URL
export ROOT_URL="https://https://github.com/catppuccin/gtk/releases/download"

# Change to the tag you want to download
export RELEASE="v1.0.3"

# Change to suite your flavor / accent combination
export FLAVOR="mocha"
export ACCENT="mauve"
curl -LsS "${ROOT_URL}/${RELEASE}/catppuccin-${FLAVOR}-${ACCENT}-standard+default.zip"

# Extract the catppuccin zip file
unzip catppuccin-${FLAVOR}-${ACCENT}-standard+default.zip

# Set the catppuccin theme directory
export THEME_DIR="$HOME/.local/share/themes/catppuccin-${FLAVOR}-${ACCENT}-standard+default"

# Optionally, add support for libadwaita
mkdir -p "${HOME}/.config/gtk-4.0" &&
ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets" &&
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css" &&
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"
```
