##!/usr/bin/env bash
#
#REPOSITORY=/home/ec2-user/test-deploy
#cd $REPOSITORY
#
#APP_NAME=instagram-clone-team5
#JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep '.jar' | tail -n 1)
#JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME
#
#CURRENT_PID=$(grep -f $APP_NAME)
#
#if [ -z $CURRENT_PID ]
#then
#  echo "> 종료할것 없음."
#else
#  echo "> kill -9 $CURRENT_PID"
#  kill -9 $CURRENT_PID
#  sleep 5
#fi
#
#echo "> $JAR_PATH 배포"
#nohup java -jar -Dspring.profiles.active=prod $JAR_PATH > /dev/null 2> /dev/null < /dev/null &