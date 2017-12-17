FROM insighttoolkit/itksoftwareguide-base as itksoftwareguide-src

ENV ITKSoftwareGuide_VERSION 19dac60789b21fffca9f499f7100e8602e64fde3
RUN git clone https://github.com/InsightSoftwareConsortium/ITKSoftwareGuide.git \
  && cd ITKSoftwareGuide \
  && git checkout ${ITKSoftwareGuide_VERSION}
