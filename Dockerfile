FROM ubuntu:18.04

# update packagelists
RUN apt-get update

# install dependencies
RUN apt-get install -y \
        build-essential \
        libgl1-mesa-glx \
        libegl1-mesa \
        libxrandr2 \
        libxrandr2 \
        libxss1 \
        libxcursor1 \
        libxcomposite1 \
        libasound2 \
        libxi6 \
        libxtst6 \
        libpng-dev \
        libglu1-mesa-dev \
        libxrandr-dev \
        libhdf5-dev \
        libxinerama-dev \
        libxcursor-dev \
        libtirpc-dev \
        libxcomposite-dev \
        libfontconfig1 \
        libxi-dev \
        libnss3-dev \
        gcc-8 \
        g++-8 \
        python3.7 \
        python3-pip \
        python3-h5py \
        python3-regex \
        qtbase5-dev \
        qt5-qmake \
        libqt5svg5-dev \
        qttools5-dev \
        git \
        nodejs \
        npm

RUN apt-get upgrade

RUN pip3 install --upgrade pip
RUN pip3 install \
         cmake

RUN useradd -ms /bin/bash docker
USER docker

VOLUME /home/docker
WORKDIR /home/docker
