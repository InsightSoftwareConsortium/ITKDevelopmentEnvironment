#!/bin/bash

set -euo pipefail

docker exec -t itkjenkins more /var/jenkins_home/secrets/initialAdminPassword
