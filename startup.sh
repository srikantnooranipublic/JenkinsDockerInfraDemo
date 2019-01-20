#!/bin/bash

####
## Purpose: To set up complete end to end apm, jenkins, app env for DevOps Demo
## Author Srikant.Noorani@Broadcom.com 
## Jan 2019
## MIT License - provided on an as is basis
#####

DATE=`date +%F_%H_%M_%S`
LOG_FILE="Logs/JenkinsDockerLog.log.$DATE"

function LOG {

 echo "$1" | tee -a $LOG_FILE

}


CONTAINERS="jmeter apm-agent apm-wv apm-em apm-db sonarqube"

clear
LOG ""
LOG "**********************************************"
LOG ""
LOG "**JenkinsDockerInfra startup Script:** "
LOG "This will setup your complete End to End APM (EM,WV,DB), Jenkins, application etc in a container. "
LOG ""
LOG "Ensure Docker, Docker Compose is installed and you are VPN'd to CA network"
LOG ""
LOG "This will remove following container (if they exists) before setting up everything again... "
LOG " $CONTAINERS"
LOG ""
LOG "Pls press Y and Enter to proceed....."
LOG ""
LOG "********************************************"
LOG ""

read READY

if [ x"$READY" != "xY" ]; then
	echo "Expected response "Y" was not found .. Exiting..."
	echo " "
	
	exit
fi


##CONTAINERS=`grep container_name docker-compose.yml |awk  '{print $2}'`

#CONTAINERS=`docker ps -aq`

LOG "Deleting Containers $CONTAINERS if they exists"	

for CONTAINER in $CONTAINERS; do
	echo "removing $CONTAINER"
	docker stop $CONTAINER
	docker rm $CONTAINER

done

chmod 400 jenkins/jenkins_home/.ssh/*

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
	#cp introscope-installer-unix-10.6.0.179-linuxAMD64.bin ${EM_FILE_FOLDER}/${EM_INSTALLER}

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


LOG ""
LOG "******* Pls wait while the containers are coming up"
LOG ""

sleep 25

LOG " Restoring APM DB. Stopping EM"


docker stop apm-em

sleep 8

docker exec -it apm-db sh -c "/usr/local/bin/DBScript.sh restore"

sleep 3
LOG " Starting EM"

docker start apm-em

sleep 15

docker ps

LOG ""
LOG "**********************************************"
LOG ""
LOG "Pls give it few mts for the containers to be fully up"

LOG ""
LOG " Key URLs and username/passwd"
LOG ""
LOG "Jenkins: http://localhost:8080/ -- username/passwd admin/CADemo123#"
LOG "APM: 127.0.0.1:9999/ApmServer -- username/passwd  admin/"
LOG "APM: 127.0.0.1:9999/#investigator -- username/passwd  admin/"


LOG ""
LOG "pls login to Jenkins and go to preconfig DevOpsFromGit project. Kick off the build to deploy and deploy the app." 
LOG ""
LOG "**********************************************"

LOG ""
