FROM dockcross/linux-x64:latest
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

RUN apt-get update && apt-get install -y \
  lcov

ENV DEFAULT_DOCKCROSS_IMAGE insighttoolkit/itk-codecov
