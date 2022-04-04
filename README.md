# Dot Files and Configuration

This is where I save all my settings and config information for my computers.

## How the dot-files system works

This directory uses a combination of GNU `stow` to position config in the `$HOME` directory ([explanation here](https://github.com/alexpearce/dotfiles)) and `$XDG_CONFIG_HOME` (set in `.zshrc`).

## Usage

- [ ] Clone

  ```bash
  $ cd
  $ git clone https://github.com/mulholio/dot-files .dot-files
  ```

- [ ] Install script

  ```bash
  $ ./install.sh
  ```

### Italics

Sometimes my terminal seems to have issues using italics within Tmux. [This guide](https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/) shows you how to fix it
