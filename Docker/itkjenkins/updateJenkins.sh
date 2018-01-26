#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]
then
  echo "Usage: $0 update_url"
  echo "'update_url' can simply be set to 'latest' to download the latest version."
  echo "or search for the appropriate version here: http://updates.jenkins-ci.org/download/war/"
  exit -1
fi

if [[ "$1" == "latest" ]]
then
  url="http://updates.jenkins-ci.org/latest/jenkins.war"
else
  url=$1
fi

wget $url -O /tmp/jenkins.war
docker cp /tmp/jenkins.war itkjenkins:/usr/share/jenkins
echo "Restart Jenkins server. We mean it!"
