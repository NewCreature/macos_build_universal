#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_curl_macos_universal.sh <path to cURL source>"
	echo ""
	exit 2
fi

cd $1
./configure --enable-shared=no --enable-static=yes --disable-ldap --host=i386-apple-darwin CFLAGS="-O2 -arch i386 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include"
make
cp lib/.libs/libcurl.a libcurl-i386.a
make clean
./configure --enable-shared=no --enable-static=yes --disable-ldap --host=x86_64-apple-darwin CFLAGS="-O2 -arch x86_64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp lib/.libs/libcurl.a libcurl-x86_64.a
make clean
./configure --enable-shared=no --enable-static=yes --disable-ldap  --host=arm-apple-darwin CFLAGS="-O2 -arch arm64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include"
make
cp lib/.libs/libcurl.a libcurl-arm64.a
lipo -create libcurl-i386.a libcurl-x86_64.a libcurl-arm64.a -output libcurl.a
cp libcurl.a lib/.libs/libcurl.a
