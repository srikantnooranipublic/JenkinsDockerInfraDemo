
echo "You Sure... Press Y..."

read isYes

if [ x"$isYes" != "xY" ]; then
	echo " Did not get Y.. exiting..."
	exit
fi

echo "Stopping all containers"

 docker stop $(docker ps --format "{{.Names}}")


sleep 5

echo " removing all container process"
docker rm -f $(docker ps -aq)

sleep 5

echo "removing all images"
docker rmi -f $(docker images -aq)


echo ""

docker images

echo ""

echo "Remove any hanging images manually"
