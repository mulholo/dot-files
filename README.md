# Dot Files

This is where I save all my settings. I struggled for ages to have a proper system in place but now I use GNU Stow in order to create symlinks and keep everything nicely organised and backed up (thanks to [Alex Pearce](https://github.com/alexpearce/dotfiles) for this.)

## Usage

```bash
$ git clone git@github.com:mulholio/dot-files.git ~/.dot-files
$ cd ~/.dot-files
$ stow
```

## Tmux

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` to install tmux plugin manager

## Italics

Sometimes my terminal seems to have issues using italics within Tmux. [This guide](https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/) shows you how to fix it
