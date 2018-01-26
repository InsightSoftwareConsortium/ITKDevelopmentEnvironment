#!/bin/bash

set -euo pipefail

if [[ ! -d $HOME/itkjenkins ]]
then
  mkdir -p $HOME/itkjenkins
fi

container_name=itkjenkins

container_exists=$(docker ps -aq --no-trunc --filter name=^/$container_name$)

if [[ "$container_exists" ]]
then
  echo "Container named $container_name already exist. Remove it first."
  exit -1
fi

docker run -p 443:4430 -v $HOME/itkjenkins:/var/jenkins_home --name $container_name -d jenkins
