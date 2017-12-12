FROM insighttoolkit/itksoftwareguide-base as itksoftwareguide-src

ENV ITKSoftwareGuide_VERSION bc26bf29db2fba1f0cdec316d8ce301b06eec2c8
RUN git clone https://github.com/InsightSoftwareConsortium/ITKSoftwareGuide.git \
  && cd ITKSoftwareGuide \
  && git checkout ${ITKSoftwareGuide_VERSION}
