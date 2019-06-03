#!/usr/bin/env bash

# starts memrise webapp

tmux new-session -d -s 'dev' -n '🎛️  ' 'wa-up'
tmux split-window -v 'docker exec -it memrise yarn dev'
tmux new-window -n '👨‍💻  ' 'v ~/proj/memrise/webapp'
tmux attach-session -d
