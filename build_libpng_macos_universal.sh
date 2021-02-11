#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_libpng_macos_universal.sh <path to libpng source>"
	echo ""
	exit 2
fi

cd $1
make clean
./configure --enable-shared=no --host=i386-apple-darwin CFLAGS="-arch i386 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include"
make
cp .libs/libpng16.a libpng-i386.a
make clean
./configure --enable-shared=no --host=x86_64-apple-darwin CFLAGS="-arch x86_64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp .libs/libpng16.a libpng-x86_64.a
make clean
./configure --enable-shared=no --host=arm-apple-darwin CFLAGS="-arch arm64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp .libs/libpng16.a libpng-arm64.a
lipo -create libpng-i386.a libpng-x86_64.a libpng-arm64.a -output libpng.a
cp libpng.a .libs/libpng16.a
