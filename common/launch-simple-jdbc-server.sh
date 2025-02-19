#!/bin/bash
cd ~/Downloads
tmux new-session -d -s jdbcserver 'python -m http.server 8080'

