#!/bin/bash

CURRENT_PORT=$(cat /etc/nginx/conf.d/service-url.inc | grep -Po '[0-9]+' | tail -1)
TARGET_PORT=0

echo "> Nginx currently proxies to ${CURRENT_PORT}."

# Toggle port number
if [ ${CURRENT_PORT} -eq 8081 ]; then
  TARGET_PORT=8082
elif [ ${CURRENT_PORT} -eq 8082 ]; then
  TARGET_PORT=8081
else
  echo "> No WAS is connected to nginx"
  exit 1
fi

# Change proxying port into target port
echo "set \$service_url http://127.0.0.1:${TARGET_PORT};" | sudo tee /etc/nginx/conf.d/service-url.inc

echo "> Now Nginx proxies to ${TARGET_PORT}."
# Reload nginx
sudo service nginx reload

echo "> Nginx reloaded."
##!/usr/bin/env bash
#
#ABSPATH=$(readlink -f $0)
#ABSDIR=$(dirname $ABSPATH)
#source ${ABSDIR}/profile.sh
#
#function switch_proxy() {
#    IDLE_PORT=$(find_idle_port)
#
#    echo "> 전환할 Port: $IDLE_PORT"
#    echo "> Port 전환"
#    # 아래 줄은 보면 echo를 통해서 나온 결과를 | 파이프라인을 통해서 service-url.inc에 덮어쓸 수 있습니다.
#    echo "set \$service_url http://3.35.218.108:${IDLE_PORT};" | sudo tee /etc/nginx/conf.d/service-url.inc
#    echo "> 엔진엑스 Reload"
#    sudo service nginx reload    # Nginx reload를 합니다.
#}