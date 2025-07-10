#!/bin/bash

whoami
pwd
ls -ld .
ls -la

echo "PATH: $PATH"
echo "ANDROID_HOME: $ANDROID_HOME"
echo "ANDROID_SDK_ROOT: $ANDROID_SDK_ROOT"
echo "ANDROID_SDK: $ANDROID_SDK"
echo "ANDROID_NDK: $ANDROID_NDK"
echo "FDROIDSERVER: $FDROIDSERVER"
echo "PYTHONPATH: $PYTHONPATH"
echo "PYTHONUNBUFFERED: $PYTHONUNBUFFERED"

git clone https://gitlab.com/f-droid-mirrors/OsmAnd-submodules.git
pushd OsmAnd-submodules
git submodule init
git submodule update --depth 1

# rm
rm -Rf android/OsmAnd-java/libs/*.jar
rm -Rf android/OsmAnd/libs/*.jar
rm -Rf android/OsmAnd-telegram/
rm -Rf resources/icons/tools/SVGtoXML/vd-tool
popd

echo 'Proceed as described in the README.'
