FROM ros:noetic-robot

#add non root user
ARG UNAME=docker
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd --create-home -u $UID -g $GID -o --shell /bin/bash $UNAME && echo "$UNAME:$UNAME" | chpasswd && adduser $UNAME sudo && usermod -a -G video $UNAME && usermod -a -G dialout $UNAME
USER $UNAME
WORKDIR /home/docker

#copy scripts from host to docker
COPY ./setupScripts/ /home/docker/scripts/

#create catkin_ws
USER root
ENV CATKIN_WS=/home/docker/catkin_ws
RUN /home/docker/scripts/createCatkin_ws.sh $CATKIN_WS
RUN chown -R docker $CATKIN_WS

#install pkgs via apt-get
RUN /home/docker/scripts/installPackages.sh

#install pkgs via pip
RUN /home/docker/scripts/installPipPkgs.sh

#install camera_aravis
RUN /home/docker/scripts/installAravis.sh

#clone private camera_aravis ROS Wrapper from gitlab
USER docker
RUN /home/docker/scripts/cloneRepos.sh $CATKIN_WS

#install packages in catkin_ws
RUN /home/docker/scripts/installCatkin_ws.sh $CATKIN_WS

#activate packet sockets for the video receiving thread for Aravis
USER root
RUN setcap cap_net_raw+ep /home/docker/catkin_ws/devel/lib/pkgconfig/camera_aravis.pc

#setup .bashrc
USER docker
RUN echo 'source /opt/ros/noetic/setup.bash' >> /home/docker/.bashrc
RUN echo "source /home/docker/catkin_ws/devel/setup.bash" >> /home/docker/.bashrc
RUN echo "LD_LIBRARY_PATH=/home/docker/catkin_ws/devel/lib:/opt/ros/noetic/lib:/usr/local/lib/" >> /home/docker/.bashrc
