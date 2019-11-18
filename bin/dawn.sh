#!/usr/bin/env bash

# Change tmux file and reload
gsed --in-place --follow-symlinks -E "s/(solarized )'dark'$/\1'light'/g" ~/.tmux.conf
tmux source-file ~/.tmux.conf

# Change vimrc
gsed --in-place --follow-symlinks "s/background=dark/background=light/g" ~/.vimrc
