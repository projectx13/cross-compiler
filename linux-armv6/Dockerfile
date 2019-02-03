FROM cross-compiler:base

# Add the cross compiler sources
RUN apt-get update && apt-get -y install \
    dpkg-cross g++-arm-linux-gnueabihf gcc-arm-linux-gnueabihf 

ENV CROSS_TRIPLE arm-linux-gnueabihf
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}

RUN cd /usr/bin && \
    # ln -s arm-linux-gnueabihf-ar ${CROSS_TRIPLE}-ar && \
    ln -s arm-linux-gnueabihf-gcc-7 ${CROSS_TRIPLE}-cc && \
    # ln -s arm-linux-gnueabihf-gcc-7 ${CROSS_TRIPLE}-gcc && \
    # ln -s arm-linux-gnueabihf-g++-7 ${CROSS_TRIPLE}-g++ && \
    ln -s arm-linux-gnueabihf-g++-7 ${CROSS_TRIPLE}-c++
    # ln -s arm-linux-gnueabihf-strip ${CROSS_TRIPLE}-strip && \
    # ln -s arm-linux-gnueabihf-ranlib ${CROSS_TRIPLE}-ranlib

# ENV CROSS_TRIPLE arm-linux-gnueabihf
# ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
# ENV PATH ${PATH}:${CROSS_ROOT}/bin
# ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
# ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}
# ENV RASPBERRYPI_TOOLS_COMMIT master

# # Enable 32 bits binaries
# RUN dpkg --add-architecture i386 && \
#     apt-get update && \
#     apt-get install -y libc6-dev:i386 libstdc++6:i386 libgcc1:i386 zlib1g:i386

# # Raspberry Pi is ARMv6+VFP2, Debian armhf is ARMv7+VFP3
# # Since this Dockerfile is targeting linux-arm from Raspberry Pi onward,
# # we're sticking with it's custom built cross-compiler with hardfp support.
# # We could use Debian's armel, but we'd have softfp and loose a good deal
# # of performance.
# # See: https://wiki.debian.org/RaspberryPi
# # We are also using the 4.7 version of the toolchain, so that glibc=2.13
# RUN curl -L https://github.com/raspberrypi/tools/archive/${RASPBERRYPI_TOOLS_COMMIT}.tar.gz | tar xz --wildcards --no-anchored "*arm-rpi-4.9.3-linux-gnueabihf*" && \
#     rsync -a /tools-${RASPBERRYPI_TOOLS_COMMIT}/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/* /usr && \
#     cd /usr/bin && \
#     rm -rf /tools-${RASPBERRYPI_TOOLS_COMMIT}


# FROM cross-compiler:base

# ENV CROSS_TRIPLE arm-linux-gnueabihf
# ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
# ENV PATH ${PATH}:${CROSS_ROOT}/bin
# ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
# ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}
# ENV RASPBERRYPI_TOOLS_COMMIT master

# # Enable 32 bits binaries
# RUN dpkg --add-architecture i386 && \
#     apt-get update && \
#     apt-get install -y libc6-dev:i386 libstdc++6:i386 libgcc1:i386 zlib1g:i386

# # Raspberry Pi is ARMv6+VFP2, Debian armhf is ARMv7+VFP3
# # Since this Dockerfile is targeting linux-arm from Raspberry Pi onward,
# # we're sticking with it's custom built cross-compiler with hardfp support.
# # We could use Debian's armel, but we'd have softfp and loose a good deal
# # of performance.
# # See: https://wiki.debian.org/RaspberryPi
# # We are also using the 4.7 version of the toolchain, so that glibc=2.13
# RUN curl -L https://github.com/raspberrypi/tools/archive/${RASPBERRYPI_TOOLS_COMMIT}.tar.gz | tar xz --wildcards --no-anchored "*gcc-linaro-${CROSS_TRIPLE}-raspbian*" && \
#     rsync -a /tools-${RASPBERRYPI_TOOLS_COMMIT}/arm-bcm2708/gcc-linaro-${CROSS_TRIPLE}-raspbian/* /usr && \
#     cd /usr/bin && \
#     ln -s ${CROSS_TRIPLE}-gcc ${CROSS_TRIPLE}-cc && \
#     rm -rf /tools-${RASPBERRYPI_TOOLS_COMMIT}
