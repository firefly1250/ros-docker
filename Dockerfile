FROM osrf/ros:foxy-desktop

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    tmux 

ARG JULIA_VERSION=1.6.3
RUN curl https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-${JULIA_VERSION}-linux-x86_64.tar.gz -o julia.tar.gz && \
    tar zxvf julia.tar.gz && \
    mv julia-${JULIA_VERSION} /opt/ && \ 
    ln -s /opt/julia-${JULIA_VERSION}/bin/julia /usr/local/bin/julia && \
    rm julia.tar.gz

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000
ARG PASSWORD=user
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME/