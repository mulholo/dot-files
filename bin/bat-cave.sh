#!/usr/bin/env bash

# generic script to start a new dev tmux session
tmux new-session -d -s 'dev' -n '🎛️  ' # put commandsat the end here as appropriatee.g. 'vim'
tmux split-window -v
tmux new-window -n '👨‍💻  '
tmux attach-session -d
