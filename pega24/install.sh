#!/bin/bash
# Run as :
# tmux new-session -d -s upgrade 'sh upgrade.sh'
#  or
# Type Ctrl+p then Ctrl+q. It will help you to turn interactive mode to daemon mode.

DOCKER_LHOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')

export DOCKER_LHOST

#Postgres container db
docker compose run pega-install

# Oracle local db
#docker-compose -f docker-compose-localdb-ora.yml run pega-upgrade

# Postgres local db
#docker-compose -f docker-compose-localdb-post.yml run pega-upgrade