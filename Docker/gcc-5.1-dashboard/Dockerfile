FROM gcc:5.1
MAINTAINER Francois Budin <francois.budin@kitware.com>

# Install required packages and clean in one step to minimize
# image size.
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates \
    curl \
    wget \
    git \
    openssh-client \
    subversion \
    autoconf \
    build-essential \
    imagemagick \
    libbz2-dev \
    libcurl4-openssl-dev \
    libevent-dev \
    libffi-dev \
    libglib2.0-dev \
    libjpeg-dev \
    liblzma-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libmysqlclient-dev \
    libncurses-dev \
    libpq-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    zlib1g-dev \
    python && \
    rm -rf /var/lib/apt/lists/*

ENV GET_PIP_URL=https://bootstrap.pypa.io/get-pip.py
RUN curl $GET_PIP_URL > /tmp/get-pip.py
RUN python /tmp/get-pip.py && python -m pip install cmake

# Normal user
RUN useradd -m kitware
RUN echo 'root:kitware' | chpasswd
RUN echo 'kitware:kitware' | chpasswd
ENV HOME /home/kitware
USER kitware
WORKDIR /home/kitware

CMD ["/bin/bash"]

