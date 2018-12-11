#!/bin/bash

#CONTAINERS=`grep container_name docker-compose.yml |awk  '{print $2}'`
CONTAINERS=`docker ps -aq`
for CONTAINER in $CONTAINERS; do
	echo "removing $CONTAINER"
	docker stop $CONTAINER
	docker rm $CONTAINER

done

PWD_NEW=`echo $PWD | sed 's_/_\\\\/_g'`
DOCKER_PATH=`echo $(which docker)|sed 's_/_\\\\/_g'`
sed 's/HOST_MOUNT_DIR/'$PWD_NEW'/g' docker-compose.yml > docker-compose.yml.changed
sed 's/HOST_DOCKER_PATH/'$DOCKER_PATH'/g' docker-compose.yml.changed > docker-compose.yml.changed1
/bin/mv -f docker-compose.yml.changed1 docker-compose.yml
/bin/rm -f docker-compose.yml.changed

docker-compose up -d

docker ps
