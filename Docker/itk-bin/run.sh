#!/bin/sh

cd ../itk-src
./run.sh
cd -

cd ../itk-data
./run.sh
cd -

docker run --volumes-from itk-src --volumes-from itk-data --name itk-bin itk-bin
