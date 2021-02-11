#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_zlib_macos_universal.sh <path to zlib source>"
	exit 2
fi

cd $1
make clean
CFLAGS="-O3 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include" ./configure --static --archs="-arch i386"
make
cp libz.a libz-i386.a
make clean
CFLAGS="-O3 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include" ./configure --static --archs="-arch x86_64"
make
cp libz.a libz-x86_64.a
make clean
CFLAGS="-O3 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include" ./configure --static --archs="-arch arm64"
make
cp libz.a libz-arm64.a
lipo -create libz-i386.a libz-x86_64.a libz-arm64.a -output libz.a
