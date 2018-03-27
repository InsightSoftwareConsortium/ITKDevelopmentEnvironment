#!/bin/bash
set -euo pipefail

sudo apt-get --yes update
sudo apt-get --yes install docker.io
sudo usermod -a -G docker $USER

echo "Please, disconnect and reconnect to update user settings."
