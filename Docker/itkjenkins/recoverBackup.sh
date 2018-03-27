#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]
then
  echo "Usage: $0 backup_file"
  exit -1
fi

installed_version=$(more ~/itkjenkins/war/META-INF/MANIFEST.MF | grep Jenkins-Version |sed 's/.*: //')
echo "Jenkins installed version: $installed_version"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
backup_version=$($DIR/getBackUpJenkinsVersion.sh $1 |sed 's/.*: //')
echo "Jenkins backup version: $backup_version"

# Taken and customized from:
# https://stackoverflow.com/questions/4023830/how-to-compare-two-strings-in-dot-separated-version-format-in-bash
vercomp () {
    comp=0
    if [[ $1 == $2 ]]
    then
        return
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        clean1=${ver1[i]//[$'\t\r\n']}
        if [[ ! ${ver2[i]+abc} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        clean2=${ver2[i]//[$'\t\r\n']}
        if ((10#$clean1 > 10#$clean2))
        then
            comp=1
            return
        fi
        if ((10#$clean1 < 10#$clean2))
        then
            return
        fi
    done
    return
}

vercomp $backup_version $installed_version

if [[ $comp -ne 0 ]]
then
  echo "Jenkins installed version is older than backup."
  echo "Update Jenkins before recovering backup."
  exit -1
fi

tar -xPvzf $1

echo "Restart Jenkins"
echo "docker stop itkjenkins"
echo "docker start itkjenkins"
