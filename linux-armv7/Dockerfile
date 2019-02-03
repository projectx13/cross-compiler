FROM cross-compiler:base

# Add the cross compiler sources
RUN apt-get update && apt-get -y install \
    dpkg-cross g++-arm-linux-gnueabihf gcc-arm-linux-gnueabihf 

ENV CROSS_TRIPLE armv7-linux-gnueabihf
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}

RUN cd /usr/bin && \
    ln -s arm-linux-gnueabihf-ar ${CROSS_TRIPLE}-ar && \
    ln -s arm-linux-gnueabihf-gcc-5 ${CROSS_TRIPLE}-cc && \
    ln -s arm-linux-gnueabihf-gcc-5 ${CROSS_TRIPLE}-gcc && \
    ln -s arm-linux-gnueabihf-g++-5 ${CROSS_TRIPLE}-g++ && \
    ln -s arm-linux-gnueabihf-g++-5 ${CROSS_TRIPLE}-c++ && \
    ln -s arm-linux-gnueabihf-strip ${CROSS_TRIPLE}-strip && \
    ln -s arm-linux-gnueabihf-ranlib ${CROSS_TRIPLE}-ranlib
