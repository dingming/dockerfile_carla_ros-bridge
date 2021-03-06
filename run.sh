#! /bin/sh

#HOSTIP=`ifconfig wlp0s20f3|grep 'inet'|grep -v 'inet6'|awk '{print $2}'`
#echo $HOSTIP

IMAGE=carlasim/carla-ros:local

SHARED_DOCKER_DIR=/home/carla
SHARED_HOST_DIR=$HOME/Program/carla/share_dir

docker run -it \
       --gpus all \
       -e DISPLAY=${DISPLAY} \
       --volume=$SHARED_HOST_DIR:$SHARED_DOCKER_DIR:rw \
       --privileged \
       --net=host \
       --group-add audio \
       $IMAGE

#       -p 2000-2002:2000-2002 \
#       -e DISPLAY=$HOSTIP:0.0 \
