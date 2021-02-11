#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: build_libjpeg_macos_universal.sh <path to libjpeg source>"
	echo ""
	exit 2
fi

cd $1
echo "Cleaning up old objects..."
rm *.o
echo "Cleaning up old libraries..."
rm *.a
echo "Compiling for i386 (-O2 -arch i386 -mmacosx-version-min=10.6)..."
gcc -O2 -arch i386 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.13.sdk -I/usr/local/include -c jcapimin.c jcapistd.c jctrans.c jcparam.c jdatadst.c jcinit.c jcmaster.c jcmarker.c jcmainct.c jcprepct.c jccoefct.c jccolor.c jcsample.c jchuff.c jcphuff.c jcdctmgr.c jfdctfst.c jfdctflt.c jfdctint.c jdapimin.c jdapistd.c jdtrans.c jdatasrc.c jdmaster.c jdinput.c jdmarker.c jdhuff.c jdphuff.c jdmainct.c jdcoefct.c jdpostct.c jddctmgr.c jidctfst.c jidctflt.c jidctint.c jidctred.c jdsample.c jdcolor.c jquant1.c jquant2.c jdmerge.c jcomapi.c jutils.c jerror.c jmemmgr.c jmemnobs.c
echo "Creating i386 library..."
ar rs libjpeg-i386.a jcapimin.o jcapistd.o jctrans.o jcparam.o jdatadst.o jcinit.o jcmaster.o jcmarker.o jcmainct.o jcprepct.o jccoefct.o jccolor.o jcsample.o jchuff.o jcphuff.o jcdctmgr.o jfdctfst.o jfdctflt.o jfdctint.o jdapimin.o jdapistd.o jdtrans.o jdatasrc.o jdmaster.o jdinput.o jdmarker.o jdhuff.o jdphuff.o jdmainct.o jdcoefct.o jdpostct.o jddctmgr.o jidctfst.o jidctflt.o jidctint.o jidctred.o jdsample.o jdcolor.o jquant1.o jquant2.o jdmerge.o jcomapi.o jutils.o jerror.o jmemmgr.o jmemnobs.o
echo "Cleaning up i386 objects..."
rm *.o
echo "Compiling for x86_64 (-O2 -arch x86_64 -mmacosx-version-min=10.6)..."
gcc -O2 -arch x86_64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -c jcapimin.c jcapistd.c jctrans.c jcparam.c jdatadst.c jcinit.c jcmaster.c jcmarker.c jcmainct.c jcprepct.c jccoefct.c jccolor.c jcsample.c jchuff.c jcphuff.c jcdctmgr.c jfdctfst.c jfdctflt.c jfdctint.c jdapimin.c jdapistd.c jdtrans.c jdatasrc.c jdmaster.c jdinput.c jdmarker.c jdhuff.c jdphuff.c jdmainct.c jdcoefct.c jdpostct.c jddctmgr.c jidctfst.c jidctflt.c jidctint.c jidctred.c jdsample.c jdcolor.c jquant1.c jquant2.c jdmerge.c jcomapi.c jutils.c jerror.c jmemmgr.c jmemnobs.c
echo "Creating x86_64 library..."
ar rs libjpeg-x86_64.a jcapimin.o jcapistd.o jctrans.o jcparam.o jdatadst.o jcinit.o jcmaster.o jcmarker.o jcmainct.o jcprepct.o jccoefct.o jccolor.o jcsample.o jchuff.o jcphuff.o jcdctmgr.o jfdctfst.o jfdctflt.o jfdctint.o jdapimin.o jdapistd.o jdtrans.o jdatasrc.o jdmaster.o jdinput.o jdmarker.o jdhuff.o jdphuff.o jdmainct.o jdcoefct.o jdpostct.o jddctmgr.o jidctfst.o jidctflt.o jidctint.o jidctred.o jdsample.o jdcolor.o jquant1.o jquant2.o jdmerge.o jcomapi.o jutils.o jerror.o jmemmgr.o jmemnobs.o
echo "Cleaning up x86_64 objects..."
rm *.o
echo "Compiling for arm64 (-O2 -arch arm64 -mmacosx-version-min=10.6)..."
gcc -O2 -arch arm64 -mmacos-version-min=10.6 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -c jcapimin.c jcapistd.c jctrans.c jcparam.c jdatadst.c jcinit.c jcmaster.c jcmarker.c jcmainct.c jcprepct.c jccoefct.c jccolor.c jcsample.c jchuff.c jcphuff.c jcdctmgr.c jfdctfst.c jfdctflt.c jfdctint.c jdapimin.c jdapistd.c jdtrans.c jdatasrc.c jdmaster.c jdinput.c jdmarker.c jdhuff.c jdphuff.c jdmainct.c jdcoefct.c jdpostct.c jddctmgr.c jidctfst.c jidctflt.c jidctint.c jidctred.c jdsample.c jdcolor.c jquant1.c jquant2.c jdmerge.c jcomapi.c jutils.c jerror.c jmemmgr.c jmemnobs.c
echo "Creating arm64 library..."
ar rs libjpeg-arm64.a jcapimin.o jcapistd.o jctrans.o jcparam.o jdatadst.o jcinit.o jcmaster.o jcmarker.o jcmainct.o jcprepct.o jccoefct.o jccolor.o jcsample.o jchuff.o jcphuff.o jcdctmgr.o jfdctfst.o jfdctflt.o jfdctint.o jdapimin.o jdapistd.o jdtrans.o jdatasrc.o jdmaster.o jdinput.o jdmarker.o jdhuff.o jdphuff.o jdmainct.o jdcoefct.o jdpostct.o jddctmgr.o jidctfst.o jidctflt.o jidctint.o jidctred.o jdsample.o jdcolor.o jquant1.o jquant2.o jdmerge.o jcomapi.o jutils.o jerror.o jmemmgr.o jmemnobs.o
echo "Creating universal library..."
lipo -create libjpeg-i386.a libjpeg-x86_64.a libjpeg-arm64.a -output libjpeg.a
