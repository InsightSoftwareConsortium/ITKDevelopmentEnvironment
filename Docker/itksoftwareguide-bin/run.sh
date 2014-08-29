#!/bin/sh

cd ../itksoftwareguide-src
./build.sh
./run.sh
cd -

cd ../itk-bin
./build.sh
./run.sh
cd -

docker run --volumes-from itksoftwareguide-src --volumes-from itk-bin --volumes-from itk-data --name itksoftwareguide-bin itksoftwareguide-bin
