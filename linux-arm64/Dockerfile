FROM cross-compiler:base

# Add the cross compiler sources
RUN apt-get update && apt-get -y install \
    dpkg-cross g++-aarch64-linux-gnu gcc-aarch64-linux-gnu 

ENV CROSS_TRIPLE aarch64-linux-gnu
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}

RUN cd /usr/bin && \
    ln -s aarch64-linux-gnu-gcc-7 ${CROSS_TRIPLE}-cc && \
    ln -s aarch64-linux-gnu-g++-7 ${CROSS_TRIPLE}-c++
