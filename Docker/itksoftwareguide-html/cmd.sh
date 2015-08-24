#!/bin/sh

cd /home/itk/bin
mkdir -p ITKSoftwareGuide
cd ITKSoftwareGuide
rm -rf *
cmake \
  -DITKSoftwareGuide_SUPERBUILD:BOOL=OFF \
  -DITK_SOURCE_DIR:PATH=/home/itk/src/ITK \
  -DITK_BINARY_DIR:PATH=/home/itk/bin/ITK \
  -DITK_DIR:PATH=/home/itk/bin/ITK \
  -DITK_EXECUTABLES_DIR:PATH=/home/itk/bin/ITK/bin \
  -DGENERATE_HTML:BOOL=ON \
  -DDRAFT_WATERMARK:BOOL=OFF \
    /home/itk/src/ITKSoftwareGuide
make
