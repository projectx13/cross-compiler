FROM cross-compiler:base

RUN apt-get update && apt-get -y install libc6-dev-i386 python

ENV CROSS_TRIPLE i686-linux-android
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${CROSS_ROOT}/bin:${PATH}
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}

COPY stdlib.patch /tmp/stdlib.patch
RUN mkdir -p /build && \
    cd /build && \
    wget -nv https://dl.google.com/android/repository/android-ndk-r19-linux-x86_64.zip && \
    cd /build && unzip android-ndk-r19-linux-x86_64.zip && \
    cd /build/android-ndk-r19 && \
    patch -p0 < /tmp/stdlib.patch && \
    ./build/tools/make_standalone_toolchain.py --arch=x86 --api=21 --install-dir=${CROSS_ROOT} && \
    cd / && \
    rm -rf /build

RUN cd ${CROSS_ROOT}/bin && \
    ln -s ${CROSS_TRIPLE}-clang ${CROSS_TRIPLE}-cc
