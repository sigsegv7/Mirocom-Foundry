#!/bin/bash

#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

set -e

if [[ $# -lt 2 ]]
then
    echo "fatal: too few arguments"
    exit 1
fi

od -An -tx4 -v $1 >$2
