#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]
then
  echo "Usage: $0 output_directory"
  exit -1
fi

if [[ ! -d $1 ]]
then
  echo "Argument must be an existing folder. Got $1"
  exit -2
fi

tar -cvzPf $1/itkJenkins-$(date -u +%Y.%m.%d-%H.%M.%S).tar.gz $HOME/itkjenkins
