# Dot Files

This is where I save all my settings and config information for my computers.

This has two main components: 1) Dot files and 2) General config information, written in this README.

## 1. Dot Files

I struggled for ages to have a proper system in place but now I use GNU Stow in order to create symlinks and keep everything nicely organised and backed up (thanks to [Alex Pearce](https://github.com/alexpearce/dotfiles) for this.)

### Usage

- []Clone

  ```bash
  $ git clone https://github.com/mulholio/dot-files ~/.dot-files
  ```

- [ ] Run `stow`

  ```bash
  $ cd ~/.dot-files
  $ stow
  ```

- [] Install Homebrew packages with Brewfile: `brew bundle`

### Tmux

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` to install tmux plugin manager

### Italics

Sometimes my terminal seems to have issues using italics within Tmux. [This guide](https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/) shows you how to fix it

---

## 2. General Config and Favourite Apps

- [Taskell](https://github.com/smallhadroncollider/taskell)
- [Alfred](https://www.alfredapp.com/)
- [Spotify](http://alfred-spotify-mini-player.com/setup/)
- [Keyboard Maestro](https://github.com/iansinnott/alfred-maestro)

---

## Appendix

### Inspiration

- https://github.com/nikitavoloboev/my-mac-os
- https://github.com/jessfraz/dotfiles/tree/master/bin
- https://github.com/jessfraz/.vim
- https://github.com/davidxmoody/dotfiles
- https://github.com/christoomey/dotfiles
- https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

