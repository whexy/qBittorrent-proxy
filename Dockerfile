# The docker file is used to compile the project for Ubuntu

FROM ubuntu:23.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    qtbase5-dev \
    qttools5-dev-tools \
    qt5-qmake \
    libqt5svg5-dev \
    libboost-all-dev \
    libtorrent-rasterbar-dev \
    && rm -rf /var/lib/apt/lists/*

# Run the build
WORKDIR /app
COPY . .
RUN ./configure && make -j8 && make install
