#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_libopus_macos_universal.sh <path to libopus source>"
	echo ""
	exit 2
fi

cd $1
make clean
./configure --enable-shared=no --host=i386-apple-darwin CFLAGS="-O2 -arch i386 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include"
make
cp .libs/libopus.a libopus-i386.a
make clean
./configure --enable-shared=no --host=x86_64-apple-darwin CFLAGS="-O2 -arch x86_64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp .libs/libopus.a libopus-x86_64.a
make clean
./configure --enable-shared=no --host=arm-apple-darwin CFLAGS="-O2 -arch arm64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp .libs/libopus.a libopus-arm64.a
lipo -create libopus-i386.a libopus-x86_64.a libopus-arm64.a -output libopus.a
cp libopus.a .libs/libopus.a
