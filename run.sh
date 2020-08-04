#! /bin/sh

HOSTIP=`ifconfig wlp0s20f3|grep 'inet'|grep -v 'inet6'|awk '{print $2}'`
echo $HOSTIP

IMAGE=carlasim/carla-ros:local

docker run -it --rm \
       --gpus all \
       -e DISPLAY=${DISPLAY} \
       -p 2000-2002:2000-2002 \
       --net=host \
       $IMAGE
#       -e DISPLAY=$HOSTIP:0.0 \
