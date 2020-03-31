FROM ubuntu:18.04

# update packagelists
RUN apt-get update

# install dependencies
RUN apt-get install -y \
        build-essential \
        curl \
        dos2unix \
        g++-8 \
        gcc-8 \
        git \
        libasound2 \
        libegl1-mesa \
        libfontconfig1 \
        libgdk-pixbuf2.0-0 \
        libgl1-mesa-glx \
        libglu1-mesa-dev \
        libhdf5-dev \
        libnss3-dev \
        libpng-dev \
        libtiff5-dev \
        libtirpc-dev \
        libxcomposite-dev \
        libxcomposite1 \
        libxcursor-dev \
        libxcursor1 \
        libxi-dev \
        libxi6 \
        libxinerama-dev \
        libxkbcommon-x11-0 \
        libxrandr-dev \
        libxrandr2 \
        libxss1 \
        libxtst6 \
        nodejs \
        npm \
        python3-h5py \
        python3-pip \
        python3-regex \
        python3.7 \
        qtchooser

RUN apt-get upgrade -y

# more dependencies through pip
RUN pip3 install --upgrade pip
RUN pip3 install \
         numpy \
         scipy \
         matplotlib \
         cmake

# QT install
ARG QT_MAJOR=5.14
ARG QT_MINOR=1
ARG QT_VERSION=${QT_MAJOR}.${QT_MINOR}

ADD qt-install-noninteractive.qs .

RUN curl -LJO# "http://download.qt.io/official_releases/qt/${QT_MAJOR}/${QT_VERSION}/qt-opensource-linux-x64-${QT_VERSION}.run"
RUN chmod +x qt-opensource-linux-x64-${QT_VERSION}.run
RUN ./qt-opensource-linux-x64-${QT_VERSION}.run --script qt-install-noninteractive.qs --verbose --platform minimal
RUN qtchooser -install opt-qt5.14.1 /opt/Qt/5.14.1/gcc_64/bin/qmake

# setup user space
RUN useradd -ms /bin/bash docker
USER docker

# add qt path to profile
RUN echo "export PATH=/opt/Qt/${QT_VERSION}/gcc_64/bin/:$PATH" >> ~/.profile

VOLUME /home/docker/ENVISIoN
WORKDIR /home/docker/ENVISIoN
