/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      This header defines the various status/error codes used
 *      throughout the system.
 * Author:
 *      Ian M. Moffett <ian@mirocom.org>
 */

#ifndef _SDK_STATUS_H_
#define _SDK_STATUS_H_ 1

#include <Sdk/Types.h>

/*
 * Recognized OS-level status codes
 */
#define OS_STATUS_SUCCESS    0x00000000     /* Success */
#define OS_STATUS_FAILURE    0x00000001     /* Failure */
#define OS_STATUS_NOT_FOUND  0x00000002     /* Resource not found */
#define OS_STATUS_NO_MEM     0x00000003     /* Out of memory */
#define OS_STATUS_UNAVL      0x00000004     /* Resource unavailable */
#define OS_STATUS_DENIED     0x00000005     /* Access denied */
#define OS_STATUS_INVALID    0x00000006     /* Invalid parameter */

/*
 * This type is to be used in whatever function returns
 * a status code.
 */
typedef INT32 OS_STATUS;

#endif  /* !_SDK_STATUS_H_ */
