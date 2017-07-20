Description
-----------

Holds the volume with the build for the Software Guide.

Volumes
-------

Source folder: /home/itk/src/ITKSoftwareGuide
Binary folder: /home/itk/bin/ITKSoftwareGuide

Usage
-----

Build in the docker container:
  ./run.sh itksoftwareguide-bin

Use ITKSoftwareGuide outside of the docker container:
  ./run.sh itksoftwareguide-bin \
    -v ${HostITKSoftwareGuidSourceDirectory}:/home/itk/src/ITKSoftwareGuide \
    -v ${HostITKSoftwareGuidBinaryDirectory}:/home/itk/bin/ITKSoftwareGuide
