#!/bin/sh

echo "Configuring ITK"
cmake -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
  -DBUILD_TESTING:BOOL=OFF \
  -DBUILD_SHARED_LIBS:BOOL=ON \
  -DITK_USE_REVIEW:BOOL=ON \
  -DModule_ITKLevelSetsv4Visualization:BOOL=ON \
    /home/itk/src/ITK/ > /dev/null
echo "Building ITK"
make -j3 > /dev/null
