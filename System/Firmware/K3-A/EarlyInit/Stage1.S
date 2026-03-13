//
// Copyright (c) 2026, Mirocom Laboratories
// Provided under the BSD-3 clause
//

    .org 0x00000000
    .section .text
    .globl _start
_start:
    hlt
    jmp _start
