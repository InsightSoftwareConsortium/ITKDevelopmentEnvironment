FROM debian:jessie
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  git \
  libncurses-dev \
  vim

# Install the latest CMake release
WORKDIR /tmp/
RUN curl -O http://www.cmake.org/files/v3.2/cmake-3.2.2.tar.gz && \
    tar xvzf cmake-3.2.2.tar.gz && \
    mkdir /tmp/cmake-build && \
    cd /tmp/cmake-build && \
    ../cmake-3.2.2/bootstrap && \
    make -j$(nproc) && \
    ./bin/cmake -DCMAKE_BUILD_TYPE:STRING=Release . && \
    make -j$(nproc) && \
    make install && \
    cd /tmp && \
    rm -rf cmake*

# Normal user
RUN useradd -m itk
RUN echo 'root:itk' | chpasswd
RUN echo 'itk:itk' | chpasswd
ENV HOME /home/itk
USER itk
WORKDIR /home/itk
RUN mkdir /home/itk/src
RUN mkdir /home/itk/bin
CMD ["/bin/bash"]
