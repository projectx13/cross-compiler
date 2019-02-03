FROM ubuntu:16.04

RUN apt-get update && apt-get -y -f install \
    bash \
    curl wget git \
    pkg-config build-essential make automake autogen libtool cmake \
    libpcre3-dev bison yodl \
    libc6-dev libc6-dev-i386 \
    tar xz-utils bzip2 gzip unzip \
    file \
    rsync \
    sed \
    upx
