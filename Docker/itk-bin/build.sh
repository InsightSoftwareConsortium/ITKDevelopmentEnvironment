#!/bin/sh

docker pull insighttoolkit/itk-base
docker build -t itk-bin .
