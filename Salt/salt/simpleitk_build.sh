#!/bin/sh

echo "Configuring SimpleITK"
cmake -DCMAKE_BUILD_TYPE:STRING=Release \
  -DBUILD_TESTING:BOOL=OFF \
  -DWRAP_LUA:BOOL=OFF \
  -DWRAP_PYTHON:BOOL=ON \
  -DWRAP_RUBY:BOOL=OFF \
  -DWRAP_TCL:BOOL=OFF \
  -DWRAP_CSHARP:BOOL=OFF \
  -DWRAP_JAVA:BOOL=OFF \
  -DUSE_SYSTEM_ITK:BOOL=ON \
  -DUSE_SYSTEM_SWIG:BOOL=ON \
  /home/itk/src/SimpleITK/SuperBuild > /dev/null
echo "Building SimpleITK"
make -j2 > /dev/null
