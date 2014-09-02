FROM insighttoolkit/itk-base
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

USER root

# Update
RUN apt-get update

# Build tools
RUN apt-get install -y --no-install-recommends texlive-latex-base
RUN apt-get install -y --no-install-recommends texlive-latex-extra
RUN apt-get install -y python
RUN apt-get install -y ghostscript
RUN apt-get install -y imagemagick
RUN apt-get install -y python-pygments
RUN apt-get install -y latex-xcolor
RUN apt-get install -y texlive-fonts-recommended

USER itk

CMD ["/bin/bash"]
