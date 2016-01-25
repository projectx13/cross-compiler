FROM debian:jessie

RUN apt-get update && apt-get -y install \
    bash \
    curl wget \
    pkg-config build-essential make automake autogen \
    tar xz-utils bzip2 gzip \
    file \
    rsync \
    sed
