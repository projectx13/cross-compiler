FROM cross-compiler:base

RUN apt-get update && apt-get -y install libc6-dev python

ENV CROSS_TRIPLE aarch64-linux-android
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
    ./build/tools/make_standalone_toolchain.py --arch=arm64 --api=21 --install-dir=${CROSS_ROOT} && \
    cd / && \
    rm -rf /build

RUN cd ${CROSS_ROOT}/bin && \
    ln -s ${CROSS_TRIPLE}-clang ${CROSS_TRIPLE}-cc

# FROM cross-compiler:base

# COPY stdlib.patch /tmp/stdlib.patch
# RUN mkdir -p /build && \
#     cd /usr && \
#     wget -nv https://dl.google.com/android/repository/android-ndk-r19-linux-x86_64.zip && \
#     unzip android-ndk-r19-linux-x86_64.zip && \
#     cd /usr/android-ndk-r19 && \
#     patch -p0 < /tmp/stdlib.patch

# ENV CROSS_TRIPLE aarch64-linux-android
# ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
# ENV PATH ${PATH}:${CROSS_ROOT}/bin:
# ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
# ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}
# ENV NDK /usr/android-ndk-r19

# RUN cd ${CROSS_ROOT}/bin && \
#     ln -s ${CROSS_TRIPLE}-gcc ${CROSS_TRIPLE}-cc


# FROM cross-compiler:base

# RUN apt-get update && apt-get -y install libc6-dev-i386 python

# ENV CROSS_TRIPLE aarch64-linux-android
# ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
# # ENV PATH ${CROSS_ROOT}/bin:${PATH}
# ENV PATH ${PATH}:${CROSS_ROOT}/bin
# ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
# ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}

# COPY stdlib.patch /tmp/stdlib.patch
# RUN mkdir -p /build && \
#     cd /build && \
#     wget -nv https://dl.google.com/android/repository/android-ndk-r19-linux-x86_64.zip && \
#     cd /build && unzip android-ndk-r19-linux-x86_64.zip && \
#     cd /build/android-ndk-r19 && \
#     patch -p0 < /tmp/stdlib.patch && \
#     ./build/tools/make_standalone_toolchain.py --arch=arm64 --api=21 --install-dir=${CROSS_ROOT} && \
#     cd / && \
#     rm -rf /build

# RUN cd ${CROSS_ROOT}/bin && \
#     ln -s ${CROSS_TRIPLE}-gcc ${CROSS_TRIPLE}-cc
