#!/bin/bash

####
## Purpose: To set up complete end to end apm, jenkins, app env for DevOps Demo
## Author Srikant.Noorani@Broadcom.com 
## Jan 2019
## MIT License - provided on an as is basis
#####

CONTAINERS="jmeter apm-agent apm-wv apm-em apm-db sonarqube"

clear
echo ""
echo "**JenkinsDockerInfra startup Script:** "
echo "This will setup your complete End to End APM (EM,WV,DB), Jenkins, application etc in a container. "
echo "Ensure Docker, Docker Compose is installed and you are VPN'd to CA network"
echo ""
echo "This will remove following container (if they exists) before setting up everything again... "
echo " $CONTAINERS"
echo ""
echo "Pls press Y and Enter to proceed....."
echo ""

read READY

if [ x"$READY" != "xY" ]; then
	echo "Expected response "Y" was not found .. Exiting..."
	echo " "
	
	exit
fi


##CONTAINERS=`grep container_name docker-compose.yml |awk  '{print $2}'`

#CONTAINERS=`docker ps -aq`

echo "Deleting Containers $CONTAINERS if they exists"	

for CONTAINER in $CONTAINERS; do
	echo "removing $CONTAINER"
	docker stop $CONTAINER
	docker rm $CONTAINER

done

PWD_NEW=`echo $PWD | sed 's_/_\\\\/_g'`
DOCKER_PATH=`echo $(which docker)|sed 's_/_\\\\/_g'`
sed 's/HOST_MOUNT_DIR/'$PWD_NEW'/g' docker-compose.yml.template > docker-compose.yml.changed
sed 's/HOST_DOCKER_PATH/'$DOCKER_PATH'/g' docker-compose.yml.changed > docker-compose.yml.changed1
/bin/mv -f docker-compose.yml.changed1 docker-compose.yml
/bin/rm -f docker-compose.yml.changed


# download EM binary if not download already

EM_FILE_FOLDER=apm/EM/EM_FILES
EM_INSTALLER=introscope-installer-unix-10.6.0.179-linuxAMD64.bin


if [ ! -f "${EM_FILE_FOLDER}/${EM_INSTALLER}" ]; then
	
	echo "EM Installer ${EM_FILE_FOLDER}/${EM_INSTALLER} Not Found. Will download (***VPN needed***). could take a while... "
	echo ""

	curl http://oerth-scx.ca.com:8081/artifactory/repo/com/ca/apm/delivery/introscope-installer-unix/10.6.0.179/introscope-installer-unix-10.6.0.179-linuxAMD64.bin -o ${EM_FILE_FOLDER}/${EM_INSTALLER}

fi


#its Webview's turn
WV_FILE_FOLDER=apm/WV/WV_FILES
WV_INSTALLER=introscope-installer-unix-10.6.0.179-linuxAMD64.bin


if [ ! -f "${WV_FILE_FOLDER}/${WV_INSTALLER}" ]; then

	echo ""
        echo "WV Installer ${WV_FILE_FOLDER}/${WV_INSTALLER} Not Found. Copying from EM Folder .. "

	cp ${EM_FILE_FOLDER}/${EM_INSTALLER} ${WV_FILE_FOLDER}
fi

#Run docker compose
docker-compose up -d

docker ps
