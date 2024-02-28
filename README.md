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
