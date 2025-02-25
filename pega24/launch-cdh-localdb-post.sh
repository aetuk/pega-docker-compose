#!/bin/bash

DOCKER_LHOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
export DOCKER_LHOST

# Start jdbc local server
sh ../common/launch-simple-jdbc-server.sh

# get hostname, tier and start
cd "$(dirname "$0")"

PEGA_HOST=$(cat /etc/hostname)
export PEGA_HOST

export PEGA_TIER=cdh
export PEGA_TYPE=ADM,Batch,RealTime,RTDG,Search,BackgroundProcessing
export CASSANDRA_CLUSTER=true
export CASSANDRA_NODES=cassandra
docker compose -f docker-compose-localdb-post.yml --profile cdh up -d 
