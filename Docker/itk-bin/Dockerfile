FROM insighttoolkit/itk-base
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

RUN mkdir /home/itk/bin
VOLUME ["/home/itk/bin"]
ADD cmd.sh /tmp/cmd.sh
CMD /tmp/cmd.sh
