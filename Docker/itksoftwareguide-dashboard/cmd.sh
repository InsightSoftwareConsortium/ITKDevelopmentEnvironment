#!/bin/sh

cd /home/itk/bin
mkdir -p ITKSoftwareGuide
cd ITKSoftwareGuide
ctest -S /home/itk/src/itksoftwareguide_dashboard.cmake -VV
