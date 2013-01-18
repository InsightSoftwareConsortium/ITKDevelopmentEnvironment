#!/bin/sh

echo "Configuring CMake..."
cmake -DCMAKE_BUILD_TYPE:STRING=Release -DBUILD_QtDialog:BOOL=ON /home/itk/src/CMake/ > /dev/null
echo "Building CMake..."
make -j3 > /dev/null
