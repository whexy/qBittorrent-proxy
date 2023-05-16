# The docker file is used to compile the project for Ubuntu

FROM ubuntu:23.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    pkg-config \
    qtbase5-dev \
    qttools5-dev-tools \
    qt5-qmake \
    libqt5svg5-dev \
    libssl-dev \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

# Run the build
WORKDIR /app
COPY . .

# Build the dependencies
RUN cd libtorrent \
    && mkdir build \ 
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=14 .. \
    && make -j10 \
    && make install

# Build the project
RUN ./configure && make -j10 && make install

ENV LD_LIBRARY_PATH="/lib:/usr/lib:/usr/local/lib"