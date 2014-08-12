FROM debian:stable
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

# Update
RUN apt-get update

# Build tools
RUN apt-get install -y build-essential
RUN apt-get install -y cmake-curses-gui
RUN apt-get install -y git

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
CMD ["/bin/bash"]

# Source tree
RUN mkdir src
RUN git clone git://itk.org/ITK.git src/ITK

# Build tree
RUN mkdir -p bin/ITK
WORKDIR /home/itk/bin/ITK
RUN cmake /home/itk/src/ITK
