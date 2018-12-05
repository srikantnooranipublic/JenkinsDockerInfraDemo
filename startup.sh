#!/bin/bash

#CONTAINERS=`grep container_name docker-compose.yml |awk  '{print $2}'`
CONTAINERS=`docker ps -aq`
for CONTAINER in $CONTAINERS; do
	echo "removing $CONTAINER
	docker stop $CONTAINER
	docker rm $CONTAINER

done

docker-compose up -d
