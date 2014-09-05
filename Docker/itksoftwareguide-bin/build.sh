#!/bin/sh

docker pull insighttoolkit/itksoftwareguide-base
docker build -t itksoftwareguide-bin .
