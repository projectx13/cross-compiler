FROM cross-compiler:base

ENV CROSS_TRIPLE x86_64-apple-darwin15
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${CROSS_ROOT}/bin:${PATH}
# ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH /usr/lib/llvm-3.9/lib:${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}

ARG SDK_VERSION=10.11
ARG DARWIN_VERSION=15
ARG OSX_VERSION_MIN=10.10
ARG OSXCROSS_REV=3034f7149716d815bc473d0a7b35d17e4cf175aa

RUN echo "deb http://apt.llvm.org/jessie/ llvm-toolchain-jessie-3.9 main" >> /etc/apt/sources.list && \
    curl http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt-get update && \
    apt-get install -y --force-yes clang-3.9 llvm-3.9-dev automake autogen \
                                   libtool libxml2-dev uuid-dev libssl-dev bash \
                                   patch make tar xz-utils bzip2 gzip sed cpio

RUN mkdir -p /osxcross && cd /osxcross && \
    curl -L "https://codeload.github.com/tpoechtrager/osxcross/tar.gz/${OSXCROSS_REV}" | tar -C /osxcross --strip=1 -xzf - && \
    # curl -L -o tarballs/MacOSX${MAC_SDK_VERSION}.sdk.tar.xz https://github.com/phracker/MacOSX-SDKs/releases/download/MacOSX10.11.sdk/MacOSX${MAC_SDK_VERSION}.sdk.tar.xz && \
    # curl -L -o tarballs/MacOSX${MAC_SDK_VERSION}.sdk.tar.xz https://s3.dockerproject.org/darwin/v2/MacOSX${MAC_SDK_VERSION}.sdk.tar.xz && \
    curl -Lo "tarballs/MacOSX${SDK_VERSION}.sdk.tar.xz" "https://s3.amazonaws.com/beats-files/deps/MacOSX10.11.sdk.tar.xz" && \
    ln -s /usr/bin/clang-3.9 /usr/bin/clang && \
    ln -s /usr/bin/clang++-3.9 /usr/bin/clang++

# RUN \
#     mkdir -p /tmp/osxcross && cd /tmp/osxcross \
#     && curl -sSL "https://codeload.github.com/tpoechtrager/osxcross/tar.gz/${OSXCROSS_REV}" \
#         | tar -C /tmp/osxcross --strip=1 -xzf - \
#     && curl -sSLo "tarballs/MacOSX${SDK_VERSION}.sdk.tar.xz" "${OSXCROSS_SDK_URL}" \
#     && UNATTENDED=yes ./build.sh >/dev/null \
#     && mv target "${OSXCROSS_PATH}" \
#     && rm -rf /tmp/osxcross "/usr/osxcross/SDK/MacOSX${SDK_VERSION}.sdk/usr/share/man"

RUN cd /osxcross/ && \
    # echo | SDK_VERSION=${MAC_SDK_VERSION} OSX_VERSION_MIN=10.10 UNATTENDED=1 OCDEBUG=1 ./build.sh && \
    UNATTENDED=yes ./build.sh && \
    mv /osxcross/target ${CROSS_ROOT} && \
    mkdir -p ${CROSS_ROOT}/lib && \
    cd / && \
    rm -rf /osxcross

RUN mkdir -p ${CROSS_ROOT} && \
    cd ${CROSS_ROOT}/bin/ && \
    for i in strip objdump ranlib nm ar; do \
        ln -s ${CROSS_TRIPLE}-${i} ${i} ; \
    done