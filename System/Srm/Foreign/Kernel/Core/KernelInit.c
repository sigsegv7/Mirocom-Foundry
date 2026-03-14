/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      This module implements the kernel startup routines used when
 *      the machine is booting.
 * Author:
 *      Ian M. Moffett <ian@mirocom.org>
 */

#include <Hal/Cpu.h>

void
KernelMain(void)
{
    /* Initialize the processor */
    HalCpuEarlyInit();

    for (;;);
}
