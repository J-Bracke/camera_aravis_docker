#!/bin/bash

CATKIN_WS=$1

source /opt/ros/noetic/setup.bash

cd $CATKIN_WS/
catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release
catkin_make install