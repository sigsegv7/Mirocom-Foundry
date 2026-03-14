#!/bin/sh

#
# Copyright (c) 2026 Mirocom Laboratories
# Provided under the BSD-3 clause
#

set -e

ISO=../../../Mizion.iso
KERNEL=../../../Kernel/Mizion.sys
CONFIG=../../../Base/Boot/limine.conf

# Generate the ISO
GenIso() {
    xorriso                                 \
        -as mkisofs                         \
        -b limine-bios-cd.bin               \
        -no-emul-boot                       \
        -boot-load-size 4                   \
        -boot-info-table                    \
        --efi-boot limine-uefi-cd.bin       \
        -efi-boot-part                      \
        --efi-boot-image                    \
        --protective-msdos-label IsoRoot/  \
        -o $ISO 1>/dev/null

    Limine/limine bios-install $ISO 1>/dev/null
    rm -rf IsoRoot
}

# Generate boot files
GenBootFiles() {
    mkdir -p IsoRoot/Boot/

    # Copy the kernel to the ISO root
    cp $KERNEL IsoRoot/Boot

    # Copy boot files
    cp $CONFIG Limine/limine-bios.sys \
        Limine/limine-bios-cd.bin \
        Limine/limine-uefi-cd.bin \
        IsoRoot/
}

GenBootFiles
GenIso
