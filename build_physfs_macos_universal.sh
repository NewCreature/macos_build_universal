#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_physfs_macos_universal.sh <path to PhysFS source>"
	echo ""
	exit 2
fi

cd $1
sudo /Volumes/MacOSExternal/Development/scripts/change_sdk.sh MacOSX10.13

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_OSX_ARCHITECTURES=i386 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.6 -DPHYSFS_BUILD_SHARED=OFF -DPHYSFS_BUILD_TEST=OFF
make
cp libphysfs.a ../libphysfs-i386.a
cd ..

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_OSX_ARCHITECTURES=x86_64 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.6 -DPHYSFS_BUILD_SHARED=OFF -DPHYSFS_BUILD_TEST=OFF
make
cp libphysfs.a ../libphysfs-x86_64.a
cd ..

sudo /Volumes/MacOSExternal/Development/scripts/change_sdk.sh MacOSX11.1

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_OSX_ARCHITECTURES=arm64 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.9 -DPHYSFS_BUILD_SHARED=OFF -DPHYSFS_BUILD_TEST=OFF
cmake .. -DCMAKE_OSX_ARCHITECTURES=arm64 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.6 -DPHYSFS_BUILD_SHARED=OFF -DPHYSFS_BUILD_TEST=OFF
make
cp libphysfs.a ../libphysfs-arm64.a
cd ..

lipo -create libphysfs-i386.a libphysfs-x86_64.a libphysfs-arm64.a -output libphysfs.a
cp libphysfs.a build/libphysfs.a
