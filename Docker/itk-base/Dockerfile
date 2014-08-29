FROM debian
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

# Update
RUN apt-get update

# Build tools
RUN apt-get install -y build-essential
RUN apt-get install -y git

RUN apt-get install -y libncurses-dev
WORKDIR /tmp/
RUN git clone -b release http://cmake.org/cmake.git
RUN mkdir /tmp/cmake-build
WORKDIR /tmp/cmake-build
RUN ../cmake/bootstrap
RUN make -j4
RUN ./bin/cmake -DCMAKE_BUILD_TYPE:STRING=Release .
RUN make
RUN make install
WORKDIR /tmp/
RUN rm -rf cmake*

# Utilities
RUN apt-get install -y vim
RUN apt-get install -y tmux

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
