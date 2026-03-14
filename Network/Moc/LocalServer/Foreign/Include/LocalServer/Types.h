/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      This header contains various data-types types used in LocalServer
 *      sources.
 * Author:
 *      Ian M. Moffett <ian@mirocomMirocom Laboratories.org>
 */

#ifndef _LOCALSERVER_TYPES_H_
#define _LOCALSERVER_TYPES_H_ 1

#include <stdint.h>
#include <stddef.h>

/* Unsigned types */
typedef uint8_t  UINT8;
typedef uint16_t UINT16;
typedef uint32_t UINT32;
#if __SIZEOF_SIZE_T__ == 8
typedef uint64_t UINT64;
typedef uint64_t USIZE;
#else
typedef uint32_t USIZE;
#endif

/* Signed types */
typedef int8_t  INT8;
typedef int16_t INT16;
typedef int32_t INT32;
#if __SIZEOF_SIZE_T__ == 8
typedef int64_t INT64;
typedef int64_t SIZE;
#else
typedef int32_t SSIZE;
#endif

#endif /* !_LOCALSERVER_TYPES_H_ */
