#!/bin/sh

cd /home/itk/bin
mkdir -p ITK
cd ITK
if test ! -e CMakeCache.txt; then
  cmake \
    -DBUILD_EXAMPLES:BOOL=ON \
    \ #-DITKV3_COMPATIBILITY:BOOL=ON \
    -DBUILD_TESTING:BOOL=ON \
    -DBUILD_SHARED:BOOL=ON \
    -DCMAKE_BUILD_TYPE:STRING=MinSizeRel \
    -DITK_USE_BRAINWEB_DATA:BOOL=ON \
    -DModule_ITKReview:BOOL=ON \
    -DExternalData_OBJECT_STORES:STRING=/home/itk/data \
      /home/itk/src/ITK
fi
make -j$(nproc)
