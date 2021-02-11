#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_libbinio_macos_universal.sh <path to libbinio source>"
	echo ""
	exit 2
fi

cd $1
make -f makefile.macos_cl clean
echo Building for i386...
make -f makefile.macos_cl MACOS_ARCHITECTURE=i386 MACOS_CXX_STDLIB=stdc++ MACOS_SDK=/Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk
mv libbinio.a libbinio-i386.a
make -f makefile.macos_cl clean
echo Building for x86_64...
make -f makefile.macos_cl MACOS_ARCHITECTURE=x86_64 MACOS_CXX_STDLIB=c++ MACOS_SDK=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk MACOS_MIN_VERSION=-mmacos-version-min=10.7
mv libbinio.a libbinio-x86_64.a
make -f makefile.macos_cl clean
echo Building for arm64...
make -f makefile.macos_cl MACOS_ARCHITECTURE=arm64 MACOS_CXX_STDLIB=c++ MACOS_SDK=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk MACOS_MIN_VERSION=-mmacos-version-min=10.7
mv libbinio.a libbinio-arm64.a
lipo -create libbinio-i386.a libbinio-x86_64.a libbinio-arm64.a -output libbinio.a
rm libbinio-i386.a libbinio-x86_64.a libbinio-arm64.a
