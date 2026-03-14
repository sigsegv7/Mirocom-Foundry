#!/bin/sh

#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

SystemStrap() {
    pushd System/Srm/Foreign
    ./Host/Bootstrap.sh
    popd
}

SystemStrap
