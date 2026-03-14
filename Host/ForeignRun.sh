#!/bin/sh

#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

set -e

DisplayHelp() {
    echo "- Foreign entities runner -"
    echo "[qemu-x64] : Run QEMU for Mizion X64 build"
    echo "[k3-vcd] : Run GTKwave on the K3 testbench"
}

QEMU_X64_FLAGS=$(cat <<EOF
    -cdrom System/Srm/Foreign/Mizion.iso
    -m 2G
    --enable-kvm
    -monitor stdio
EOF
)

case $1 in
    "qemu-x64")
        qemu-system-x86_64 $QEMU_X64_FLAGS
        ;;
    "k3-vcd")
        gtkwave Platform/K3-A/Testbench/soc.vcd
        ;;
    *)
        echo "[!] Invalid option"
        DisplayHelp
        ;;
esac
