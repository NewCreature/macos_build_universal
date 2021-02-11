#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_libvorbis_macos_universal.sh <path to libvorbis source>"
	echo ""
	exit 2
fi

cd $1
make clean
./configure --enable-shared=no --host=i386-apple-darwin CFLAGS="-arch i386 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include"
make
cp lib/.libs/libvorbis.a libvorbis-i386.a
cp lib/.libs/libvorbisfile.a libvorbisfile-i386.a
make clean
./configure --enable-shared=no --host=x86_64-apple-darwin CFLAGS="-arch x86_64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp lib/.libs/libvorbis.a libvorbis-x86_64.a
cp lib/.libs/libvorbisfile.a libvorbisfile-x86_64.a
make clean
./configure --enable-shared=no --host=arm-apple-darwin CFLAGS="-arch arm64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp lib/.libs/libvorbis.a libvorbis-arm64.a
cp lib/.libs/libvorbisfile.a libvorbisfile-arm64.a
lipo -create libvorbis-i386.a libvorbis-x86_64.a libvorbis-arm64.a -output libvorbis.a
cp libvorbis.a lib/.libs/libvorbis.a
lipo -create libvorbisfile-i386.a libvorbisfile-x86_64.a libvorbisfile-arm64.a -output libvorbisfile.a
cp libvorbisfile.a lib/.libs/libvorbisfile.a
