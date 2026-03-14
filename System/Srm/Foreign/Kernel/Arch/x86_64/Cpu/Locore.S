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

    pop %r15
    pop %r14
    pop %r13
    pop %r12
    pop %r11
    pop %rbx
    retq                        /* And back to the caller we go */
