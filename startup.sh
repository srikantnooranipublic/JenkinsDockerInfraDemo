#!/bin/bash

#CONTAINERS=`grep container_name docker-compose.yml |awk  '{print $2}'`
CONTAINERS=`docker ps -aq`
for CONTAINER in $CONTAINERS; do
	echo "removing $CONTAINER"
	docker stop $CONTAINER
	docker rm $CONTAINER

done

PWD_NEW=`echo $PWD | sed 's_/_\\\\/_g'`
sed 's/COMPOSE_DIR/'$PWD_NEW'/g' docker-compose.yml > docker-compose.yml.changed
/bin/mv -f docker-compose.yml.changed docker-compose.yml

docker-compose up -d

docker ps
