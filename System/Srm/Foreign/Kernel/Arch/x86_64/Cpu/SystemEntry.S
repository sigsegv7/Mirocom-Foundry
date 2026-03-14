/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

    .text
    .globl _start
_start:
    /*
     * This is where the bootloader passes control to us during system
     * startup. We expect the machine to be in the following state:
     *
     * 1) Interrupts disabled
     * 2) Direction flag cleared
     *
     * Our job here is to to the minimal amount of initialization before
     * passing control to the actual kernel to which it will perform other
     * kinds of initialization.
     */

    cli                 /* Clear interrupts */
    cld                 /* Clear direction flag */
    xor %rbp, %rbp      /* Denote end of callstack */

1:  hlt
    jmp 1b
