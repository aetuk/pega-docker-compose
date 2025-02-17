#!/bin/bash
# Run as :
# tmux new-session -d -s upgrade 'sh upgrade.sh'
#  or
# Type Ctrl+p then Ctrl+q. It will help you to turn interactive mode to daemon mode.

DOCKER_HOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')

#Postgres container db
docker-compose run pega-install

# Oracle local db
#docker-compose -f docker-compose-localdb-ora.yml run pega-install

# Postgres local db
#docker-compose -f docker-compose-localdb-post.yml run pega-install