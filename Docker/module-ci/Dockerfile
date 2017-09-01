FROM docker:17.06.1-ce-git
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
  && apk update \
  && apk add \
    curl \
    cmake \
    expat-dev \
    g++ \
    jpeg-dev \
    libpng-dev \
    ninja \
    python3-dev \
    tiff-dev \
    zlib-dev \
  && ln -s /usr/bin/python3 /usr/bin/python

# ITK master 2017-08-28
ENV ITK_VERSION ed702da240b4984ce61684bf078cab7bb8301acc
RUN git clone https://github.com/InsightSoftwareConsortium/ITK.git \
  && cd ITK \
  && git checkout ${ITK_VERSION} \
  && rm -rf .git
RUN mkdir ITK-build \
  && cd ITK-build \
  && cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING=MinSizeRel \
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DITK_USE_SYSTEM_EXPAT:BOOL=ON \
    -DITK_USE_SYSTEM_JPEG:BOOL=ON \
    -DITK_USE_SYSTEM_PNG:BOOL=ON \
    -DITK_USE_SYSTEM_TIFF:BOOL=ON \
    -DITK_USE_SYSTEM_ZLIB:BOOL=ON \
    ../ITK \
  && ninja \
  && find . -name '*.o' -delete
