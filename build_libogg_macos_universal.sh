#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_libogg_macos_universal.sh <path to libogg source>"
	echo ""
	exit 2
fi

cd $1
make clean
/Volumes/MacOSExternal/Development/scripts/change_sdk.sh MacOSX10.13
./configure --enable-shared=no --host=i386-apple-darwin CFLAGS="-arch i386 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include"
make
cp src/.libs/libogg.a libogg-i386.a
make clean
./configure --enable-shared=no --host=x86_64-apple-darwin CFLAGS="-arch x86_64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp src/.libs/libogg.a libogg-x86_64.a
make clean
/Volumes/MacOSExternal/Development/scripts/change_sdk.sh MacOSX11.0
./configure --enable-shared=no --host=arm-apple-darwin CFLAGS="-arch arm64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp src/.libs/libogg.a libogg-arm64.a
lipo -create libogg-i386.a libogg-x86_64.a libogg-arm64.a -output libogg.a
cp libogg.a src/.libs/libogg.a
