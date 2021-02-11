#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_freetype_macos_universal.sh <path to freetype source>"
	echo ""
	exit 2
fi

cd $1
make clean
./configure --enable-shared=no --enable-biarch-config --with-bzip2=no --with-harfbuzz=no --with-brotli=no --host=i386-apple-darwin CFLAGS="-arch i386 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include"
make
cp objs/.libs/libfreetype.a libfreetype-i386.a
make clean
./configure --enable-shared=no --enable-biarch-config --with-bzip2=no --with-harfbuzz=no --with-brotli=no --host=x86_64-apple-darwin CFLAGS="-arch x86_64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp objs/.libs/libfreetype.a libfreetype-x86_64.a
make clean
./configure --enable-shared=no --enable-biarch-config --with-bzip2=no --with-harfbuzz=no --with-brotli=no --host=arm-apple-darwin CFLAGS="-arch arm64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp objs/.libs/libfreetype.a libfreetype-arm64.a
lipo -create libfreetype-i386.a libfreetype-x86_64.a libfreetype-arm64.a -output libfreetype.a
cp libfreetype.a objs/.libs/libfreetype.a
