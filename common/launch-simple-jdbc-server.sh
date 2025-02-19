#!/bin/bash
cd ~/Downloads
tmux new-session -d -s jdbcserver 'python3 -m http.server 8081'

