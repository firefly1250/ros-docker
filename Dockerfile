FROM osrf/ros:melodic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  python-catkin-tools \
  ros-melodic-ros-control \
  ros-melodic-ros-controllers

RUN apt update && apt install -y \
    git \
    sudo \
    lsb-release \
    bash-completion \
    vim \
    tmux 