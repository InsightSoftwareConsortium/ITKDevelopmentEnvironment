FROM insighttoolkit/itksoftwareguide-base as itksoftwareguide-src

ENV ITKSoftwareGuide_VERSION 6ccb80ccf0d5805886782888b63e0d371625a021
RUN git clone https://github.com/InsightSoftwareConsortium/ITKSoftwareGuide.git \
  && cd ITKSoftwareGuide \
  && git checkout ${ITKSoftwareGuide_VERSION}
