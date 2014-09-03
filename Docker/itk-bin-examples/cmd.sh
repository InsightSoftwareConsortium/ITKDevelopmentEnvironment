#!/bin/sh

cd /home/itk/bin
mkdir -p ITK
cd ITK
cmake \
  -DBUILD_EXAMPLES:BOOL=ON \
  -DITKV3_COMPATIBILITY:BOOL=ON \
  -DBUILD_TESTING:BOOL=OFF \
  -DExternalData_OBJECT_STORES:STRING=/home/itk/data \
    /home/itk/src/ITK
make -j$(nproc)
