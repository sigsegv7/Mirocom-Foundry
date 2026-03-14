/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      Mirocom Local Server common definitions
 * Author:
 *      Ian M. Moffett <ian@mirocomMirocom Laboratories.org>
 */

#ifndef LOCALSERVER_COMMON_H
#define LOCALSERVER_COMMON_H 1

#include <string.h>

/*
 * Various compiler attributes
 */
#define ATTR(x) __attribute__((x))
#define PACKED  ATTR(__packed__)

/* Zero an 'n' sized buffer */
#define BZERO(BUF, N) \
    memset((BUF), 0, (N))

/* Obtain length of string */
#define STRLEN(STR) \
    strlen((STR))

/* Copy bytes */
#define MEMCPY(DEST, SRC, N) \
    memcpy((DEST), (SRC), (N))

#endif /* !LOCALSERVER_COMMON_H */
