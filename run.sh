#!/bin/bash

MODE=$1
ID=$2
PORT=80

case "$MODE" in
	'test')
		;;
	'dev')
		;;
	*)
		echo "Usage: run.sh <test|dev> <ID>"
		exit 1
		;;
esac

if [ -z $NUM ]; then
	echo "Usage: run.sh <test|dev> <ID>"
	exit 1
fi	

DOCKER_NAME=$MODE-tomcat-$ID

docker kill $DOCKER_NAME
docker rm $DOCKER_NAME
docker run --name=$DOCKER_NAME -d -v /app/web/jk/$MODE:/webapps -v /data/jk/$MODE/logs/tomcat/$ID:/logs daocloud.io/l0veblue/tomcat6
