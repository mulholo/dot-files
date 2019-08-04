#!/usr/bin/env bash

# Change tmux file and reload
sed -i '' -E "s/(solarized )'dark'$/\1'light'/g" ~/.tmux.conf
tmux source-file ~/.tmux.conf

# Change vimrc
sed -i '' 's/background=dark/background=light/g' ~/.vimrc
