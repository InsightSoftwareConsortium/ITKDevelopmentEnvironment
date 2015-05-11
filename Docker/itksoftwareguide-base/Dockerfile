FROM insighttoolkit/itk-base
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

USER root

# Using --no-install-recommends greatly reduces the installed packages
RUN apt-get update && apt-get install -y --no-install-recommends \
  texlive-latex-base \
  texlive-latex-extra
RUN apt-get update && apt-get install -y \
  ghostscript \
  imagemagick \
  python \
  python-pygments \
  latex-xcolor \
  tex4ht \
  texlive-fonts-recommended

USER itk

CMD ["/bin/bash"]
