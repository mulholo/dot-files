#!/usr/bin/env bash

# starts memrise web client

tmux new-session -d -s 'dev' -n '🎛️  ' 'wc-up'
tmux split-window -v
tmux new-window -n '👨‍💻  ' 'v ~/proj/memrise/web_client'
tmux attach-session -d
