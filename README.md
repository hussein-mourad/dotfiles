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

## Change Theme checklist

- [ ] i3 Configuration, Path: `~/.config/i3/`
- [ ] i3status or i3blocks Configuration
- [ ] i3lock Configuration `~/.local/bin/lockscreen`
- [ ] dunst Configuration
- [ ] rofi Configuration
- [ ] dmenu `.dmenurc` or rofi
- [ ] Terminal Configuration
- [ ] tmux Configuration
- [ ] neovim Configuration
- [ ] zathura Configuration
- [ ] yazi Configuration
- [ ] bat Configuration
- [ ] change wallpaper
- [ ] GTK/QT Applications

# TODO

- [ ] Configure nvim from scartch to avoid depending on an external distro
