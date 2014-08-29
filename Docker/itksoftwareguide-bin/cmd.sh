#!/bin/sh

cd /home/itk/bin
mkdir -p ITKSoftwareGuide
cd ITKSoftwareGuide
cmake \
  -DITK_DIR:PATH=/home/itk/bin/ITK \
    /home/itk/src/ITKSoftwareGuide
make -j$(nproc)
