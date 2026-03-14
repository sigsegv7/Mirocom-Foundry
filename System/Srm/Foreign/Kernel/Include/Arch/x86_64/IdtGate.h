/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      This header defines structures and macros related to
 *      the x64 interrupt descriptor table.
 * Author:
 *      Ian M. Moffett <ian@mirocom.org>
 */

#ifndef _MACHINE_IDTGATE_H_
#define _MACHINE_IDTGATE_H_ 1

/* IDT gate types */
#define IDT_INT_GATE    0x8E
#define IDT_TRAP_GATE   0x8F
#define IDT_USER_GATE   0xEE

#endif  /* !_MACHINE_IDTGATE_H_ */
