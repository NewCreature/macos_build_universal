#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_libopusfile_macos_universal.sh <path to libopusfile source>"
	echo ""
	exit 2
fi

cd $1
make clean
./configure --enable-shared=no --host=i386-apple-darwin --disable-http CFLAGS="-O2 -arch i386 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include"
make
cp .libs/libopusfile.a libopusfile-i386.a
make clean
./configure --enable-shared=no --host=x86_64-apple-darwin --disable-http CFLAGS="-O2 -arch x86_64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp .libs/libopusfile.a libopusfile-x86_64.a
make clean
./configure --enable-shared=no --host=arm-apple-darwin --disable-http CFLAGS="-O2 -arch arm64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp .libs/libopusfile.a libopusfile-arm64.a
lipo -create libopusfile-i386.a libopusfile-x86_64.a libopusfile-arm64.a -output libopusfile.a
cp libopusfile.a .libs/libopusfile.a
