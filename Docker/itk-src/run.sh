#!/bin/sh

name=itk-src

if docker ps -a | awk '{print $NF}' | grep -q ^${name}$; then
  echo "Have ${name}, restarting..."
  docker start ${name} > /dev/null
  echo "Exit code: $(docker wait ${name})"
else
  echo "Running new container, ${name}..."
  docker run --name ${name} ${name}
fi
