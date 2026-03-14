/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      This module implements low-level / machine-specific
 *      CPU initialization logic.
 * Author:
 *      Ian M. Moffett <ian@mirocom.org>
 */

    .text
    .set IA32_EFER, 0xC0000080
    .set EFER_NXE,  (1 << 11)
    .globl MdCpuLoInit
MdCpuLoInit:
    /*
     * Used for early low level initialization of the current
     * processor core.
     */

    push %rbx
    push %r11
    push %r12
    push %r13
    push %r14
    push %r15

    mov $IA32_EFER, %ecx        /* IA32_EFER -> ECX */
    rdmsr                       /* MSR -> EDX:EAX */
    or $EFER_NXE, %eax          /* Enable no-execute bits */
    wrmsr                       /* Write the MSR back */

    lgdt (g_GDTR)               /* Load our own flat GDT */
    push $0x08                  /* LRET FRAME: CS */
    lea 1f(%rip), %rbx          /* Load our drop point */
    push %rbx                   /* LRET FRAME: RIP */
    lretq                       /* Far return ahead */

1:  mov $0x10, %ax              /* Data segment */
    mov %ax, %ds                /* DATA -> DS*/
    mov %ax, %es                /* DATA -> ES */
    mov %ax, %ss                /* DATA -> SS */
    xor %ax, %ax                /* Others will be left available */
    mov %ax, %fs                /* ZERO -> FS */
    mov %ax, %gs                /* ZERO -> GS */

    pop %r15
    pop %r14
    pop %r13
    pop %r12
    pop %r11
    pop %rbx
    retq                        /* And back to the caller we go */

     .section .data
    .globl g_GDT
g_GDT:
.NULL:
    .word 0x0000
    .word 0x0000
    .byte 0x00
    .byte 0b00000000
    .byte 0b00000000
    .byte 0x00
.CODE:
    .word 0x0000
    .word 0x0000
    .byte 0x00
    .byte 0b10011010
    .byte 0b00100000
    .byte 0x00
.DATA:
    .word 0x0000
    .word 0x0000
    .byte 0x00
    .byte 0b10010010
    .byte 0b00000000
    .byte 0x00
.UCODE:
    .word 0x0000
    .word 0x0000
    .byte 0x00
    .byte 0b11111010
    .byte 0b10101111
    .byte 0x00
.UDATA:
    .word 0x0000
    .word 0x0000
    .byte 0x00
    .byte 0b11110010
    .byte 0b00000000
    .byte 0x00
.TSS:
    .quad 0x00
    .quad 0x00

    .globl g_GDTR
g_GDTR:
    .word g_GDTR - g_GDT
    .quad g_GDT
