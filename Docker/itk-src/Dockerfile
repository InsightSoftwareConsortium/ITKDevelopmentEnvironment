FROM insighttoolkit/itk-base
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>
# Holds the volume with source code.

WORKDIR /home/itk
RUN mkdir src
VOLUME ["/home/itk/src"]
CMD git clone http://itk.org/ITK.git src/ITK
