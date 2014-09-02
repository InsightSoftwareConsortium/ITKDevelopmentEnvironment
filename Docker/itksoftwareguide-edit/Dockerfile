FROM insighttoolkit/itksoftwareguide-base
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

# Build and install NodeJS
USER root
WORKDIR /tmp/
RUN mkdir nodejs
WORKDIR /tmp/nodejs
RUN apt-get install -y wget
RUN wget -N http://nodejs.org/dist/node-latest.tar.gz
RUN tar xzvf node-latest.tar.gz
RUN cd node-v* && ./configure
RUN cd node-v* && make -j$(nproc) install
RUN rm -rf /tmp/nodejs

# Install nodeMirror
WORKDIR /home/itk/bin
RUN apt-get install -y x11-utils xdotool
USER itk
RUN npm install node-mirror
RUN npm install pty.js
EXPOSE 3000

RUN mkdir /home/itk/bin/ITKSoftwareGuide
VOLUME ["/home/itk/bin/ITKSoftwareGuide"]
WORKDIR /home/itk/bin/ITKSoftwareGuide
ADD cmd.sh /tmp/cmd.sh
CMD /tmp/cmd.sh
