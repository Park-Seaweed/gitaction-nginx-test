#!/usr/bin/bash

ABSPATH=$(readlink -f $0)
ABSDIR=$(dirname $ABSPATH)
source ${ABSDIR}/profile.sh

function switch_proxy() {
    IDLE_PORT=$(find_idle_port)

    echo "> 전환할 port: $IDLE_PORT"
    echo "> port 전환"
    echo "> set \$service_url http://127.0.0.1:${IDLE_PORT}" | sudo tee /home/ec2-user/service_url.inc

    echo "> Nginx Reload"

    sudo service nginx reload
}
#
#CURRENT_PORT=$(cat /home/ec2-user/service_url.inc | grep -Po '[0-9]' | tail -1)
#TARGET_PORT=0
#
#echo "> Nginx currently proxies to ${CURRENT_PORT}."
#
#if [ ${CURRENT_PORT} -eq 8081 ]; then
#    TARGET_PORT=8082
#elif [ ${CURRENT_PORT} -eq 8082 ]; then
#    TARGET_PORT=8081
#else
#  echo "> No WAS is connected to nginx"
#  exit 1
#fi
#
#echo "set \$service_url http://127.0.0.1:${TARGET_PORT};" | tee /home/ec2-user/service_url.inc
#
#echo "> Now Nginx proxies to ${TARGET_PORT}."
#
#sudo service nginx reload
#
#echo "> Nginx reloaded"