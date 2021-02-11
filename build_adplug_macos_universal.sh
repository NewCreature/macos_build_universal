#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_adplug_macos_universal.sh <path to adplug source>"
	echo ""
	exit 2
fi

cd $1
make -f makefile.macos_cl clean
echo Building for i386...
make -f makefile.macos_cl MACOS_ARCHITECTURE=i386 MACOS_CXX_STDLIB=stdc++ MACOS_SDK=/Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk
mv libadplug.a libadplug-i386.a
make -f makefile.macos_cl clean
echo Building for x86_64...
make -f makefile.macos_cl MACOS_ARCHITECTURE=x86_64 MACOS_CXX_STDLIB=c++ MACOS_SDK=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk MACOS_MIN_VERSION=-mmacos-version-min=10.7
mv libadplug.a libadplug-x86_64.a
make -f makefile.macos_cl clean
echo Building for arm64...
make -f makefile.macos_cl MACOS_ARCHITECTURE=arm64 MACOS_CXX_STDLIB=c++ MACOS_SDK=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk MACOS_OFLAGS=-O2 MACOS_MIN_VERSION=-mmacos-version-min=10.7
mv libadplug.a libadplug-arm64.a
lipo -create libadplug-i386.a libadplug-x86_64.a libadplug-arm64.a -output libadplug.a
rm libadplug-i386.a libadplug-x86_64.a libadplug-arm64.a
