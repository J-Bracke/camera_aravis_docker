#!/bin/sh

NAMEOFIMAGE=camera_aravis_setup
NAMEOFCONTAINER=camera_aravis

#build image:

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo '[-] process the Dockerfile'

docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) \
             -t ${NAMEOFIMAGE} \
             ${DIR}/dockerfiles



#create container:

commonparams="--device=/dev/video0 \
        --name=${NAMEOFCONTAINER} \
        --privileged \
        --network=host \
        --ipc=host
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /tmp/.X11-unix:/tmp/.X11-unix
        --user="$(id --user):$(id --group)"
        -v /dev/bus/usb:/dev/bus/usb \
        -e ROS_HOSTNAME=$(hostname) \
        --volume="$HOME/.Xauthority:/home/docker/.Xauthority:rw" \
        -e DISPLAY=$DISPLAY \
        -u docker \
        -w "/home/docker" \
        -v $HOME/.ssh:/home/docker/.ssh \
        -v /etc/timezone:/etc/timezone:ro \
        -v /etc/localtime:/etc/localtime:ro \
        -it \
        -d"

docker run \
        $commonparams \
        ${NAMEOFIMAGE} \
        /bin/bash \
        || { echo '\e[31mcontainer not created!\e[39m'; exit 1; }
