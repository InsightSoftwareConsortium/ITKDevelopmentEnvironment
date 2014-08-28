FROM debian
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>
# The base build with tools, utilities, and normal user for ITK development.

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
