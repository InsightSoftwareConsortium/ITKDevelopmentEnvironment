#!/bin/sh

# Use this script to run the docker image in a container

usage() {
cat << EOF
$0 image-name

Will run the docker image <image-name> in a container. If the container was
already run, it will restart it.

Example

  ./run.sh itk-src
EOF
}

if test $# -lt 1 -o "$1" == "-h" -o "$1" == "--help"; then
  usage
  exit
fi


name=$1

volume_deps=$(cat ${name}/volume_deps.txt 2>/dev/null)
for dep in $volume_deps; do
  ./build.sh $dep
  ./run.sh $dep
done

if docker ps -a | awk '{print $NF}' | grep -q ^${name}$; then
  echo "Have ${name}, restarting..."
  docker start ${name} > /dev/null
  docker logs -f ${name} &
  exit_code=$(docker wait ${name})
  echo "Exit code: $exit_code"
else
  echo "Running new container, ${name}..."
  for dep in $volume_deps; do
    volumes_from="$volumes_from --volumes-from $dep "
  done
  docker run -P $volumes_from --name ${name} ${name}
fi
