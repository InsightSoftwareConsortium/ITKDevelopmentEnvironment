#!/bin/sh

if test -e src/ITKSoftwareGuide/.git; then
  cd src/ITKSoftwareGuide
  git pull
else
  git clone http://itk.org/ITKSoftwareGuide.git src/ITKSoftwareGuide
fi
