#!/bin/sh

if test -e src/ITK/.git; then
  cd src/ITK
  git pull
else
  git clone https://github.com/InsightSoftwareConsortium/ITK.git src/ITK
fi
