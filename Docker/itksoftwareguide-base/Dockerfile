FROM debian:stretch as itksoftwareguide-base
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

RUN apt-get update && apt-get install -y \
  apt-utils \
  build-essential \
  curl \
  git \
  ninja-build \
  python \
  vim \
  && apt-get clean

# Install the latest CMake release
WORKDIR /tmp/
RUN curl  -L https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    pip install cmake
WORKDIR /

# Using --no-install-recommends greatly reduces the installed packages
RUN apt-get update && apt-get install -y --no-install-recommends \
  texlive-latex-base \
  texlive-latex-extra
RUN apt-get update && apt-get install -y \
  ghostscript \
  locales \
  imagemagick \
  python \
  python-pygments \
  latex-xcolor \
  tex4ht \
  texlive-fonts-recommended \
  && apt-get clean
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
