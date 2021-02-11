#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_libflac_macos_universal.sh <path to libFLAC source>"
	echo ""
	exit 2
fi

cd $1
make clean
sudo /Volumes/MacOSExternal/Development/scripts/change_sdk.sh MacOSX10.13
./configure --enable-shared=no --enable-static=yes --disable-asm-optimizations --host=i386-apple-darwin CFLAGS="-arch i386 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include" CXXFLAGS="-arch i386 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include"
make
cp src/libFLAC/.libs/libFLAC.a libFLAC-i386.a
cp src/libFLAC++/.libs/libFLAC++.a libFLAC++-i386.a
make clean
./configure --enable-shared=no --enable-static=yes --disable-asm-optimizations --host=x86_64-apple-darwin CFLAGS="-arch x86_64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include" CXXFLAGS="-arch x86_64 -mmacos-version-min=10.7 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -stdlib=libc++"
make
cp src/libFLAC/.libs/libFLAC.a libFLAC-x86_64.a
cp src/libFLAC++/.libs/libFLAC++.a libFLAC++-x86_64.a
make clean
sudo /Volumes/MacOSExternal/Development/scripts/change_sdk.sh MacOSX11.0
./configure --enable-shared=no --enable-static=yes --disable-asm-optimizations --host=arm-apple-darwin CFLAGS="-arch arm64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include" CXXFLAGS="-arch arm64 -mmacos-version-min=10.7 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -stdlib=libc++"
make
cp src/libFLAC/.libs/libFLAC.a libFLAC-arm64.a
cp src/libFLAC++/.libs/libFLAC++.a libFLAC++-arm64.a
lipo -create libFLAC-i386.a libFLAC-x86_64.a libFLAC-arm64.a -output libFLAC.a
cp libFLAC.a src/libFLAC/.libs/libFLAC.a
lipo -create libFLAC++-i386.a libFLAC++-x86_64.a libFLAC++-arm64.a -output libFLAC++.a
cp libFLAC++.a src/libFLAC++/.libs/libFLAC++.a
