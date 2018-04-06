#!/bin/sh

# Use this script to build the docker image.

usage() {
cat << EOF
$0 image-name [--pull]

Will build the docker image <image-name>.  If --pull is specified, the base
image and DockerHub version on the image will be pulled before a build.

Example

  ./build.sh itk-src --pull
EOF
}

if test $# -lt 1 -o "$1" = "-h" -o "$1" = "--help"; then
  usage
  exit
fi


image=$1
shift

pull=false
if test "$2" = "--pull"; then
  pull=true
fi

from=$(grep FROM ${image}/Dockerfile | awk '{print $2}')
if $pull; then
  docker pull insighttoolkit/$image
  docker pull $from
fi

docker build "$@" -t insighttoolkit/$image $image
