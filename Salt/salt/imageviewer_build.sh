#!/bin/sh

echo "Configuring ImageViewer"
cmake -DCMAKE_BUILD_TYPE:STRING=Release \
  -DITK_DIR:PATH=/usr/local/lib/cmake/ITK-4.3/ \
    /home/itk/src/ImageViewer/ > /dev/null
echo "Building ImageViewer"
make -j3 > /dev/null
