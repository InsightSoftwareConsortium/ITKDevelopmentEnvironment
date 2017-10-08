FROM insighttoolkit/itksoftwareguide-src as itksoftwareguide-itk

RUN mkdir /ITKSoftwareGuide-build
WORKDIR /ITKSoftwareGuide-build
ARG ITK_GIT_TAG
RUN cmake \
  -GNinja \
  -DITKSoftwareGuide_SUPERBUILD:BOOL=ON \
  -DGENERATE_HTML:BOOL=ON \
  -DITK_GIT_TAG:STRING=${ITK_GIT_TAG} \
  -DCMAKE_BUILD_TYPE:STRING=MinSizeRel \
     /ITKSoftwareGuide
RUN ninja -j5 RunExamples
# Additional run because of dependency issues?
RUN ninja -j5 RunExamples
