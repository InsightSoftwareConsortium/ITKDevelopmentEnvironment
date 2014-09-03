#!/bin/sh

cd /home/itk/bin
mkdir -p ITK
cd ITK
cmake \
  -DBUILD_EXAMPLES:BOOL=OFF \
  -DBUILD_TESTING:BOOL=OFF \
  -DBUILD_TESTING:BOOL=ON \
  -DExternalData_OBJECT_STORES:STRING=/home/itk/data \
    /home/itk/src/ITK
make -j$(nproc)
