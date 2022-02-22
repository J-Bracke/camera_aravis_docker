#!/bin/bash

# BASIC TOOLS
apt-get update -q && apt-get install -qy --no-install-recommends \
                            apt-utils \
                            build-essential \
                            python3-catkin-tools \
                            python3-catkin-pkg \
                            python3-osrf-pycommon \
                            python3-setuptools \
                            python3-pip \
                            ssh \
                            tmux \
                            git \
                            nano \
                            locate \
                            bluez \
                            intltool \
                            libxml2-dev \
                            libgtk-3-dev \
                            gtk-doc-tools \
                            libgstreamer1.0-0 \
                            libgstreamer1.0-0-dbg \
                            libgstreamer1.0-dev \
                            libgstreamer-gl1.0-0 \
                            libgstreamer-plugins-bad1.0-0 \
                            libgstreamer-plugins-base1.0-0 \
                            libgstreamer-plugins-good1.0-0 \
                            libgstreamer-plugins-base1.0-dev \
                            libgstreamer-plugins-bad1.0-dev \
                            libgstreamer-plugins-good1.0-dev \
                            gstreamer1.0-plugins-bad \
                            gstreamer1.0-gl \
                            gstreamer1.0-gtk3 \
                            gstreamer1.0-packagekit \
                            gstreamer1.0-plugins-bad \
                            gstreamer1.0-plugins-base \
                            gstreamer1.0-plugins-base-apps \
                            gstreamer1.0-plugins-good \
                            gstreamer1.0-tools \
                            gstreamer1.0-x \
                            libnotify-dev \
                            libcanberra-gtk-module \
                            libcanberra-gtk3-module \
                            xz-utils



# ADDITIONAL ROS PACKAGES
apt-get update -q && apt-get install -qy --no-install-recommends \
                            ros-noetic-ddynamic-reconfigure \
                            ros-noetic-rqt-reconfigure \
			                ros-noetic-cv-bridge \
                            ros-noetic-vision-opencv \
                            ros-noetic-image-common	\
                            ros-noetic-image-pipeline \
                            ros-noetic-rviz


rm -rf /var/lib/apt/lists/*

# ros-noetic-tf2-sensor-msgs \
# ros-noetic-rgbd-launch
