#!/bin/sh

echo "Configuring SimpleITK"
cmake -DCMAKE_BUILD_TYPE:STRING=Release \
  -DBUILD_TESTING:BOOL=OFF \
  -DWRAP_LUA:BOOL=OFF \
  -DWRAP_PYTHON:BOOL=ON \
  -DWRAP_RUBY:BOOL=OFF \
  /home/itk/src/SimpleITK/ > /dev/null
echo "Building SimpleITK"
make -j2 > /dev/null
