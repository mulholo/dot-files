# Dot Files and Configuration

Config for my computer.

## How the dot-files system works

This directory uses a combination of GNU `stow` to position config in the `$HOME` directory ([explanation here](https://github.com/alexpearce/dotfiles)) and `$XDG_CONFIG_HOME` (set in `.zshrc`).

## Usage

1. Clone the repository, paying attention to exact ".dot-files" naming.

```bash
$ cd
$ git clone https://github.com/mulholio/dot-files .dot-files
```

2. Run the install script

```bash
$ ./install.sh
```

## Scripts

Custom bash scripts are stored in /bin. New files that get added here are automatically included in the PATH via this line in the zshrc:

```sh
export PATH="$PATH:$HOME/.dot-files/bin"
```

## Italics

Sometimes my terminal seems to have issues using italics within Tmux. [This guide](https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/) shows you how to fix it.
