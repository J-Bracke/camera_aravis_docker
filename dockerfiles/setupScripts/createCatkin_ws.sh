#!/bin/bash

CATKIN_WS=$1

source /opt/ros/noetic/setup.bash

mkdir -p $CATKIN_WS/src/
cd $CATKIN_WS/src/
catkin_init_workspace
