#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]
then
  echo "Usage: $0 backup_file"
  exit -1
fi

# Force return code to be 0. Without `true` call, return code is 141...
tar -axPf $1 ~/itkjenkins/war/META-INF/MANIFEST.MF -O | grep Jenkins-Version -m 1 || true
