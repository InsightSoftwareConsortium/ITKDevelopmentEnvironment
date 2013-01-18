#!/bin/sh

echo "Installing SimpleITK..."
make install > /dev/null
echo "Installing SimpleITK Python module..."
cd Wrapping
python PythonPackage/setup.py install
