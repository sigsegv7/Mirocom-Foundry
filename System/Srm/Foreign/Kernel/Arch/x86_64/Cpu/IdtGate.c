/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      This source file implements the core interrupt descriptor table
 *      related logic.
 * Author:
 *      Ian M. Moffett <ian@mirocom.org>
 */

#include <Machine/IdtGate.h>
#include <Sdk/Defs.h>

ALIGN(8) static IDT_GATE_DESC Idt[256];
static IDTR Idtr = {
    .Limit = sizeof(Idt) - 1,
    .Offset = (UINTPTR)&Idt[0]
};

void
MdIdtSetGate(UINT8 Vector, UINTPTR IsrBase, UINT8 Ist, UINT8 Type)
{
    IDT_GATE_DESC *Desc;

    Desc = &Idt[Vector];
    Desc->OffsetLow   = (IsrBase & 0xFFFF);
    Desc->OffsetMid   = (IsrBase >> 16) & 0xFFFF;
    Desc->OffsetHigh  = (IsrBase >> 32) & 0xFFFFFFFF;
    Desc->Present     = 1;
    Desc->Dpl         = (Type == IDT_USER_GATE) ? 3 : 0;
    Desc->CodeSegment = 0x08;
    Desc->Ist         = Ist;
    Desc->Zero        = 0;
    Desc->Zero1       = 0;
    Desc->Reserved    = 0;
    Desc->Type        = Type;
}

void
MdIdtLoad(void)
{
    ASMV(
        "lidt %0"
        :
        : "m" (Idtr)
        : "memory"
    );
}
