FROM insighttoolkit/itksoftwareguide-base as itksoftwareguide-src

ENV ITKSoftwareGuide_VERSION e0a381f82679ed8fe2ca58cb9d0262dcd1be5ccc
RUN git clone https://github.com/InsightSoftwareConsortium/ITKSoftwareGuide.git \
  && cd ITKSoftwareGuide \
  && git checkout ${ITKSoftwareGuide_VERSION}
