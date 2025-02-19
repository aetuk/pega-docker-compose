#!/bin/bash
cd ~/Download
tmux new-session -d -s jdbcserver 'python -m http.server 8080'

