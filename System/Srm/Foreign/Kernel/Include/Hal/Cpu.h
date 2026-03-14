/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      This header exposes the CPU HAL API which allows for
 *      unification of low-level CPU functionality between
 *      machines.
 * Author:
 *      Ian M. Moffett <ian@mirocom.org>
 */

#ifndef _HAL_CPU_H_
#define _HAL_CPU_H_ 1

/*
 * Perform early processor initialization for the
 * current core.
 */
void HalCpuEarlyInit(void);

#endif  /* !_HAL_CPU_H_ */
