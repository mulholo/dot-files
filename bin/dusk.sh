#!/usr/bin/env bash

# Change tmux file and reload
sed -i '' -E "s/(solarized )'light'$/\1'dark'/g" ~/.tmux.conf
tmux source-file ~/.tmux.conf

# Change vimrc
sed -i '' 's/background=light/background=dark/g' ~/.vimrc
