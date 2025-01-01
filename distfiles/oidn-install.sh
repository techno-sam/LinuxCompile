#!/bin/bash

INCLUDE_INSTALL_DIR="$1"/include
LIBRARY_INSTALL_DIR="$1"/lib

mkdir -p $INCLUDE_INSTALL_DIR
mkdir -p $LIBRARY_INSTALL_DIR

cp -av include/OpenImageDenoise $INCLUDE_INSTALL_DIR

cp -av lib/lib* $LIBRARY_INSTALL_DIR

rm -v $LIBRARY_INSTALL_DIR/libtbb.so
rm -v $LIBRARY_INSTALL_DIR/libtbb.so.2
rm -v $LIBRARY_INSTALL_DIR/libtbb.so.12
cp -v $LIBRARY_INSTALL_DIR/libtbb.so.12.11 $LIBRARY_INSTALL_DIR/libtbb.so.12

pushd $(pwd)
cd $LIBRARY_INSTALL_DIR
ln -s libOpenImageDenoise.so libOpenImageDenoise.so.0
popd
