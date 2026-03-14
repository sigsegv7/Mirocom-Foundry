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

#include <Sdk/Types.h>
#include <Sdk/Defs.h>

/* IDT gate types */
#define IDT_INT_GATE    0x8E
#define IDT_TRAP_GATE   0x8F
#define IDT_USER_GATE   0xEE

/*
 * Interrupt descriptor table gate
 *
 * See section 7.14.1 of the Intel SDM
 */
typedef struct {
    UINT16 OffsetLow;
    UINT16 CodeSegment;
    UINT8 Ist : 3;
    UINT8 Zero : 5;
    UINT8 Type : 4;
    UINT8 Zero1 : 1;
    UINT8 Dpl : 2;
    UINT8 Present : 1;
    UINT16 OffsetMid;
    UINT32 OffsetHigh;
    UINT32 Reserved;
} IDT_GATE_DESC;

/*
 * Representation of the interrupt descriptor table
 * register
 *
 * See section 7.10 of the Intel SDM
 */
typedef struct PACKED {
    UINT16 Limit;
    UINTPTR Offset;
} IDTR;

/*
 * Set an IDT gate descriptor entry
 *
 * @Vector:  Vector of IDT gate descriptor
 * @IsrBase: Base of interrupt service routine
 * @Ist:     Interrupt stack table index
 * @Type:    Interrupt gate type
 */
void MdIdtSetGate(UINT8 Vector, UINTPTR IsrBase, UINT8 Ist, UINT8 Type);

/*
 * Load the interrupt descriptor table
 */
void MdIdtLoad(void);

#endif  /* !_MACHINE_IDTGATE_H_ */
