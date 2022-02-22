#!/bin/bash

cd /home/docker/scripts
cp aravis-0.6.0.tar.xz /home/docker/
cd ..
tar -xf aravis-0.6.0.tar.xz
cd aravis-0.6.0
./configure --enable-viewer
make
make install
