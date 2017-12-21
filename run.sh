#!/bin/bash

#
# Run docker container with the following parameters
#  user: current user
#  group: current group
#  home dir: current user's home dir
#  volumes: current users's home directory
#           
# NOT USED: --mount source=github,target=/home/pprakash/stuff/github 
#
# Inside the container, start vncserver and provide password if needed.
# Run vncviewer <ipaddr>:5901
#
docker run --user $(id -u $USER):$(id -g $USER) \
	-w "$HOME" \
	--privileged \
	-p 5901:5901 \
	-v /etc/passwd:/etc/passwd:ro \
        -v $HOME:/$HOME \
	-it \
	dev-env 
