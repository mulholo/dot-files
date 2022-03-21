#!/usr/bin/env bash

# Change tmux file and reload
gsed --in-place --follow-symlinks -E "s/(solarized )'light'$/\1'dark'/g" ~/.tmux.conf
tmux source-file ~/.tmux.conf

# Change vimrc
gsed --in-place --follow-symlinks 's/background=light/background=dark/g' ~/.vimrc
