#!/bin/sh

cd ../itksoftwareguide-src
./build.sh
./run.sh
cd -

cd ../itk-bin-testing
./build.sh
./run.sh
cd -

docker run \
 -it \
 -P \
 --volumes-from itksoftwareguide-src \
 --volumes-from itk-bin-testing \
 --volumes-from itk-data \
 --name itksoftwareguide-edit \
 itksoftwareguide-edit
