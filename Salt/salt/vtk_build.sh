#!/bin/sh

echo "Configuring VTK"
cmake \
  -DCMAKE_BUILD_TYPE:STRING=Release \
  -DBUILD_SHARED_LIBS:BOOL=ON \
  -DBUILD_TESTING:BOOL=OFF \
  /home/itk/src/VTK/ > /dev/null
echo "Building VTK"
make -j3 > /dev/null
