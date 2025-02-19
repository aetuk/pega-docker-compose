#!/bin/bash

DOCKER_LHOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
export DOCKER_LHOST

#TODO Start jdbc local server

# get hostname, tier and start
cd "$(dirname "$0")"

PEGA_HOST=$(cat /etc/hostname)
export PEGA_HOST

export PEGA_TIER=cdh
export PEGA_TYPE=ADM,Batch,RealTime,RTDG,Search,BackgroundProcessing
export CASSANDRA_CLUSTER=true
export CASSANDRA_NODES=cassandra
docker compose -f docker-compose-localdb-ora.yml --profile cdh up -d 
