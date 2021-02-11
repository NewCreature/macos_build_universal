#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_dumb_macos_universal.sh <path to DUMB source>"
	echo ""
	exit 2
fi

cd $1
make clean
sudo /Volumes/MacOSExternal/Development/scripts/change_sdk.sh MacOSX10.13

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_OSX_ARCHITECTURES=i386 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.6 -DBUILD_ALLEGRO4=OFF -DBUILD_EXAMPLES=OFF
make
cp libdumb.a ../libdumb-i386.a
cd ..

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_OSX_ARCHITECTURES=x86_64 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.6 -DBUILD_ALLEGRO4=OFF -DBUILD_EXAMPLES=OFF
make
cp libdumb.a ../libdumb-x86_64.a
cd ..

sudo /Volumes/MacOSExternal/Development/scripts/change_sdk.sh MacOSX11.1

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_OSX_ARCHITECTURES=arm64 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.6 -DBUILD_ALLEGRO4=OFF -DBUILD_EXAMPLES=OFF
make
cp libdumb.a ../libdumb-arm64.a
cd ..

lipo -create libdumb-i386.a libdumb-x86_64.a libdumb-arm64.a -output libdumb.a
cp libdumb.a build/libdumb.a
