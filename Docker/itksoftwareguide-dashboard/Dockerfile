FROM insighttoolkit/itksoftwareguide-base
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

RUN mkdir /home/itk/bin/ITKSoftwareGuide
VOLUME ["/home/itk/bin/ITKSoftwareGuide"]
WORKDIR /home/itk/bin/ITKSoftwareGuide
ADD dashboard.cmake /home/itk/src/itksoftwareguide_dashboard.cmake
ADD cmd.sh /tmp/cmd.sh
CMD /tmp/cmd.sh
