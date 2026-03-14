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

/* From Locore.S */
void MdCpuLoInit(void);

void
HalCpuEarlyInit(void)
{
    MdCpuLoInit();
}
