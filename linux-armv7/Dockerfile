FROM cross-compiler:base

# Add the cross compiler sources
RUN echo "deb http://emdebian.org/tools/debian/ jessie main" >> /etc/apt/sources.list && \
    dpkg --add-architecture armhf && \
    curl -L http://emdebian.org/tools/debian/emdebian-toolchain-archive.key | apt-key add -

RUN apt-get update && apt-get -y install crossbuild-essential-armhf

ENV CROSS_TRIPLE armv7-linux-gnueabihf
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}

RUN cd /usr/bin && \
    ln -s arm-linux-gnueabihf-ar ${CROSS_TRIPLE}-ar && \
    ln -s arm-linux-gnueabihf-gcc-4.9 ${CROSS_TRIPLE}-cc && \
    ln -s arm-linux-gnueabihf-gcc-4.9 ${CROSS_TRIPLE}-gcc && \
    ln -s arm-linux-gnueabihf-g++-4.9 ${CROSS_TRIPLE}-g++ && \
    ln -s arm-linux-gnueabihf-g++-4.9 ${CROSS_TRIPLE}-c++ && \
    ln -s arm-linux-gnueabihf-strip ${CROSS_TRIPLE}-strip && \
    ln -s arm-linux-gnueabihf-ranlib ${CROSS_TRIPLE}-ranlib
