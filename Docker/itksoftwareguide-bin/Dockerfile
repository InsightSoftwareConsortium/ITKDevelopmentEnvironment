FROM insighttoolkit/itksoftwareguide-base
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

RUN mkdir /home/itk/bin/ITKSoftwareGuide
VOLUME ["/home/itk/bin/ITKSoftwareGuide"]
ADD cmd.sh /tmp/cmd.sh
CMD /tmp/cmd.sh
