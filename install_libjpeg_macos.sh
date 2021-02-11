#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: install_libjpeg_macos.sh <path to libjpeg source>"
	echo ""
	exit 2
fi

cd $1
echo "Copying files..."
cp jconfig.h /usr/local/include
cp jerror.h /usr/local/include
cp jmorecfg.h /usr/local/include
cp jpeglib.h /usr/local/include
cp jversion.h /usr/local/include
cp libjpeg.a /usr/local/lib
