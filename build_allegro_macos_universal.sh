#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_allegro_macos_universal.sh <path to Allegro 5 source>"
	echo ""
	exit 2
fi

cd $1
sudo /Volumes/MacOSExternal/Development/scripts/change_sdk.sh MacOSX10.13

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_OSX_ARCHITECTURES=i386 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.6 -DFREETYPE_PNG=ON -DFREETYPE_ZLIB=ON -DSHARED=OFF -DWANT_NATIVE_IMAGE_LOADER=OFF -DWANT_DEMO=OFF -DWANT_EXAMPLES=OFF -DWANT_TESTS=OFF -DWANT_VIDEO=OFF -DWANT_IMAGE_FREEIMAGE=OFF -DZLIB_INCLUDE_DIR=/usr/local/include -DZLIB_LIBRARY_RELEASE=/usr/local/lib/libz.a
make
cp lib/liballegro-static.a ../liballegro-static-i386.a
cp lib/liballegro_acodec-static.a ../liballegro_acodec-static-i386.a
cp lib/liballegro_audio-static.a ../liballegro_audio-static-i386.a
cp lib/liballegro_color-static.a ../liballegro_color-static-i386.a
cp lib/liballegro_dialog-static.a ../liballegro_dialog-static-i386.a
cp lib/liballegro_font-static.a ../liballegro_font-static-i386.a
cp lib/liballegro_image-static.a ../liballegro_image-static-i386.a
cp lib/liballegro_main-static.a ../liballegro_main-static-i386.a
cp lib/liballegro_memfile-static.a ../liballegro_memfile-static-i386.a
cp lib/liballegro_physfs-static.a ../liballegro_physfs-static-i386.a
cp lib/liballegro_primitives-static.a ../liballegro_primitives-static-i386.a
cp lib/liballegro_ttf-static.a ../liballegro_ttf-static-i386.a
cd ..

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_OSX_ARCHITECTURES=x86_64 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.6 -DFREETYPE_PNG=ON -DFREETYPE_ZLIB=ON -DSHARED=OFF -DWANT_NATIVE_IMAGE_LOADER=OFF -DWANT_DEMO=OFF -DWANT_EXAMPLES=OFF -DWANT_TESTS=OFF -DWANT_VIDEO=OFF -DWANT_IMAGE_FREEIMAGE=OFF -DZLIB_INCLUDE_DIR=/usr/local/include -DZLIB_LIBRARY_RELEASE=/usr/local/lib/libz.a
make
cp lib/liballegro-static.a ../liballegro-static-x86_64.a
cp lib/liballegro_acodec-static.a ../liballegro_acodec-static-x86_64.a
cp lib/liballegro_audio-static.a ../liballegro_audio-static-x86_64.a
cp lib/liballegro_color-static.a ../liballegro_color-static-x86_64.a
cp lib/liballegro_dialog-static.a ../liballegro_dialog-static-x86_64.a
cp lib/liballegro_font-static.a ../liballegro_font-static-x86_64.a
cp lib/liballegro_image-static.a ../liballegro_image-static-x86_64.a
cp lib/liballegro_main-static.a ../liballegro_main-static-x86_64.a
cp lib/liballegro_memfile-static.a ../liballegro_memfile-static-x86_64.a
cp lib/liballegro_physfs-static.a ../liballegro_physfs-static-x86_64.a
cp lib/liballegro_primitives-static.a ../liballegro_primitives-static-x86_64.a
cp lib/liballegro_ttf-static.a ../liballegro_ttf-static-x86_64.a
cd ..

sudo /Volumes/MacOSExternal/Development/scripts/change_sdk.sh MacOSX11.1

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_OSX_ARCHITECTURES=arm64 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.9 -DFREETYPE_PNG=ON -DFREETYPE_ZLIB=ON -DSHARED=OFF -DWANT_NATIVE_IMAGE_LOADER=OFF -DWANT_DEMO=OFF -DWANT_EXAMPLES=OFF -DWANT_TESTS=OFF -DWANT_VIDEO=OFF -DWANT_IMAGE_FREEIMAGE=OFF -DZLIB_INCLUDE_DIR=/usr/local/include -DZLIB_LIBRARY_RELEASE=/usr/local/lib/libz.a
cmake .. -DCMAKE_OSX_ARCHITECTURES=arm64 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.6 -DFREETYPE_PNG=ON -DFREETYPE_ZLIB=ON -DSHARED=OFF -DWANT_NATIVE_IMAGE_LOADER=OFF -DWANT_DEMO=OFF -DWANT_EXAMPLES=OFF -DWANT_TESTS=OFF -DWANT_VIDEO=OFF -DWANT_IMAGE_FREEIMAGE=OFF -DZLIB_INCLUDE_DIR=/usr/local/include -DZLIB_LIBRARY_RELEASE=/usr/local/lib/libz.a
make
cp lib/liballegro-static.a ../liballegro-static-arm64.a
cp lib/liballegro_acodec-static.a ../liballegro_acodec-static-arm64.a
cp lib/liballegro_audio-static.a ../liballegro_audio-static-arm64.a
cp lib/liballegro_color-static.a ../liballegro_color-static-arm64.a
cp lib/liballegro_dialog-static.a ../liballegro_dialog-static-arm64.a
cp lib/liballegro_font-static.a ../liballegro_font-static-arm64.a
cp lib/liballegro_image-static.a ../liballegro_image-static-arm64.a
cp lib/liballegro_main-static.a ../liballegro_main-static-arm64.a
cp lib/liballegro_memfile-static.a ../liballegro_memfile-static-arm64.a
cp lib/liballegro_physfs-static.a ../liballegro_physfs-static-arm64.a
cp lib/liballegro_primitives-static.a ../liballegro_primitives-static-arm64.a
cp lib/liballegro_ttf-static.a ../liballegro_ttf-static-arm64.a
cd ..

lipo -create liballegro-static-i386.a liballegro-static-x86_64.a liballegro-static-arm64.a -output liballegro-static.a
cp liballegro-static.a build/lib/liballegro-static.a

lipo -create liballegro_acodec-static-i386.a liballegro_acodec-static-x86_64.a liballegro_acodec-static-arm64.a -output liballegro_acodec-static.a
cp liballegro_acodec-static.a build/lib/liballegro_acodec-static.a

lipo -create liballegro_audio-static-i386.a liballegro_audio-static-x86_64.a liballegro_audio-static-arm64.a -output liballegro_audio-static.a
cp liballegro_audio-static.a build/lib/liballegro_audio-static.a

lipo -create liballegro_color-static-i386.a liballegro_color-static-x86_64.a liballegro_color-static-arm64.a -output liballegro_color-static.a
cp liballegro_color-static.a build/lib/liballegro_color-static.a

lipo -create liballegro_dialog-static-i386.a liballegro_dialog-static-x86_64.a liballegro_dialog-static-arm64.a -output liballegro_dialog-static.a
cp liballegro_dialog-static.a build/lib/liballegro_dialog-static.a

lipo -create liballegro_font-static-i386.a liballegro_font-static-x86_64.a liballegro_font-static-arm64.a -output liballegro_font-static.a
cp liballegro_font-static.a build/lib/liballegro_font-static.a

lipo -create liballegro_image-static-i386.a liballegro_image-static-x86_64.a liballegro_image-static-arm64.a -output liballegro_image-static.a
cp liballegro_image-static.a build/lib/liballegro_image-static.a

lipo -create liballegro_main-static-i386.a liballegro_main-static-x86_64.a liballegro_main-static-arm64.a -output liballegro_main-static.a
cp liballegro_main-static.a build/lib/liballegro_main-static.a

lipo -create liballegro_memfile-static-i386.a liballegro_memfile-static-x86_64.a liballegro_memfile-static-arm64.a -output liballegro_memfile-static.a
cp liballegro_memfile-static.a build/lib/liballegro_memfile-static.a

lipo -create liballegro_physfs-static-i386.a liballegro_physfs-static-x86_64.a liballegro_physfs-static-arm64.a -output liballegro_physfs-static.a
cp liballegro_physfs-static.a build/lib/liballegro_physfs-static.a

lipo -create liballegro_primitives-static-i386.a liballegro_primitives-static-x86_64.a liballegro_primitives-static-arm64.a -output liballegro_primitives-static.a
cp liballegro_primitives-static.a build/lib/liballegro_primitives-static.a

lipo -create liballegro_ttf-static-i386.a liballegro_ttf-static-x86_64.a liballegro_ttf-static-arm64.a -output liballegro_ttf-static.a
cp liballegro_ttf-static.a build/lib/liballegro_ttf-static.a
