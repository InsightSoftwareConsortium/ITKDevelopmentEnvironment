#!/bin/bash

die() {
  echo ""
  echo "changed=yes comment=\"$1\""
  exit 1
}

echo "downloading fiji..."
fiji_tarball=fiji-nojre.zip
wget "http://jenkins.imagej.net/job/Stable-Fiji/lastSuccessfulBuild/artifact/${fiji_tarball}" \
  || die "fiji download failed"
unzip $fiji_tarball
rm $fiji_tarball

echo "downloading the nifti io plugin..."
cd Fiji.app/plugins
wget http://rsbweb.nih.gov/ij/plugins/download/jars/nifti_io.jar \
  || die "fiji download failed"

echo "Creating ImageJ symlink..."
cd /usr/local/bin
os=$(uname -m)
if test "$os" = "x86_64"; then
  ln -s /opt/Fiji.app/ImageJ-linux64 ImageJ
else
  ln -s /opt/Fiji.app/ImageJ-linux32 ImageJ
fi

echo -e '\nchanged=no'
