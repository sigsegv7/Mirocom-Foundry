#!/bin/sh

#
# Copyright (c) 2026 Mirocom Laboratories
# Provided under the BSD-3 clause
#

set -e

if [ -d "Limine" ]; then
    echo "Limine already pulled"
else
	git clone https://codeberg.org/Limine/Limine.git --branch=v10.x-binary --depth=1 Limine
    make -C Limine
fi
