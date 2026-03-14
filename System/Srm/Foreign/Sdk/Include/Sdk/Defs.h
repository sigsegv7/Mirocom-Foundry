/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      This header provides C related macros and helpers
 *      to make life easier.
 * Author:
 *      Ian M. Moffett <ian@mirocom.org>
 */

#ifndef _SDK_DEFS_H_
#define _SDK_DEFS_H_ 1

/* C attribute wrappers */
#define ATTR(x)         __attribute__((x))
#define PACKED          ATTR(packed)
#define NO_RETURN       ATTR(no_return)
#define ALWAYS_INLINE   ATTR(always_inline)
#define LIKELY(exp)     __builtin_expect(((exp) != 0), 1)
#define UNLIKELY(exp)   __builtin_expect(((exp) != 0), 0)

/* Obtain the size of a fixed array */
#define NELEM(arr) (sizeof(arr) / sizeof(arr[0]))

/* Pointer offset macros */
#define PTR_OFFSET(p, off) ((void *)(char *)(p) + (off))
#define PTR_NOFFSET(p, off) ((void *)(char *)(p) - (off))

/* Bit related macros */
#define BIT(n) (1ULL << (n))
#define ISSET(v, f)  ((v) & (f))

/* Align up/down a value */
#define ALIGN_DOWN(value, align)      ((value) & ~((align)-1))
#define ALIGN_UP(value, align)        (((value) + (align)-1) & ~((align)-1))

/* Bitmap helper macros */
#define SETBIT(a, b) ((a)[(b) >> 3] |= BIT(b % 8))
#define CLRBIT(a, b) ((a)[(b) >> 3] &= ~BIT(b % 8))
#define TESTBIT(a, b) (ISSET((a)[(b) >> 3], BIT(b % 8)))

/* Min/max macros */
#define MIN(a,b) (((a) < (b)) ? (a) : (b))
#define MAX(a,b) (((a) > (b)) ? (a) : (b))

#endif  /* !_SDK_DEFS_H_ */
