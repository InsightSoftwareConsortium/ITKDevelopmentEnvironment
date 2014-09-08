#!/bin/sh

if test -e src/ITK/.git; then
  cd src/ITK
  git pull
else
  git clone http://itk.org/ITK.git src/ITK
fi
