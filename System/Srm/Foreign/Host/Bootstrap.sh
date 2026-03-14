#!/bin/sh

#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

#
# Make the required directory structure for the
# system and toolchain to build.
#
MakeDirs() {
    mkdir -p Var/root/usr/include/
    mkdir -p Var/root/usr/bin
}

#
# Check if a list of deps are installed on
# the system.
#
# $@: List of dep names to check
#
CheckDep() {
    printf "Checking dependencies... "
    sleep 0.1

    for dep in $@; do
        which $dep &>/dev/null
        if [ $? -ne 0 ]; then
            echo "FATAL"
            echo "The dependency '$dep' is not installed\n"
        fi
    done

    # Everything went well
    echo "OK"
}

#
# Obtain the toolchain dep
#
ToolchainDep() {
    git clone https://git.mirocom.org/Mirocom/mirocom-toolchain --depth=1 Var/cc/toolchain
    pushd Var/cc/toolchain
    tar -xzvf toolchain.tar.gz
    mv public/* .; rm -rf public/
    popd
}

CheckDep        \
    "xorriso"   \
    "git"       \
    "gcc"       \
    "make"      \
    "rsync"     \
    "tar"       \
    "wget"

MakeDirs
ToolchainDep
