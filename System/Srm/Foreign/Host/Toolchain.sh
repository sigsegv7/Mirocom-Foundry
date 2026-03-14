#!/bin/sh

#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

LOCK_FILE=Var/cc/.lock
TARGET=x86_64-pc-mirocom
MAKE=make

if [ "$1" == "k3" ]; then
    exit 0
fi

Build() {
    # Build binutils and patch gcc
    cd Var/cc/toolchain/
    bash build.sh

    # Prep the build directory
    cd ../
    mkdir -p gcc
    cd gcc/

    # Configure gcc
    ../toolchain/gcc-patched/configure --target=$TARGET \
        --prefix=$(pwd) --with-sysroot=$(pwd)/../../root/ \
        --disable-nls --enable-languages=c --disable-multilib

    # Build gcc
    $MAKE all-gcc
    $MAKE install-gcc

    # Lock the directory
    cd ../
    touch .lock
}

# Don't build again if the lock exists
if [ ! -f "$LOCK_FILE" ]; then
    Build
    rm -rf ../gcc
else
    echo "$LOCK_FILE exists, skipping toolchain build"
fi
