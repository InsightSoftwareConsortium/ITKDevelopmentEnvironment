#!/bin/sh

cd /home/itk/src/ITKDashboard
git pull
ctest -S dashboard.cmake -V
