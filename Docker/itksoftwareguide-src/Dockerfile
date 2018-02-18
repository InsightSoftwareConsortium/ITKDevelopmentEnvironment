FROM insighttoolkit/itksoftwareguide-base as itksoftwareguide-src

ENV ITKSoftwareGuide_VERSION f9508e33dce0591cf0e155f336b2335eb7936327
RUN git clone https://github.com/InsightSoftwareConsortium/ITKSoftwareGuide.git \
  && cd ITKSoftwareGuide \
  && git checkout ${ITKSoftwareGuide_VERSION}
