#!/bin/sh

cd ../itk-src
./build.sh
./run.sh
cd -

cd ../itk-data
./build.sh
./run.sh
cd -

docker run --volumes-from itk-src --volumes-from itk-data --name itk-bin itk-bin
