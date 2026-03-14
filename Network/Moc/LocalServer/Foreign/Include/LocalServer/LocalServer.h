/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      Local server definitions and server-side
 *      interfaces.
 * Author:
 *      Ian M. Moffett <ian@mirocom.org>
 */

#ifndef LOCALSERVER_LOCALSERVER_H
#define LOCALSERVER_LOCALSERVER_H

#include "LocalServer/Types.h"

/*
 * MOC local server state machine
 *
 * @ServerName: Name of server, used for IPC path
 * @SocketFd: Socket file descriptor
 */
typedef struct {
    char ServerName[32];
    int SocketFd;
} MOC_LOCAL_SERVER;

/*
 * Create a new local server
 *
 * @Name:   Name of local server
 * @Result: Result is written here
 *
 * Returns zero on success
 */
INT32 LocalServerCreate(const char *Name, MOC_LOCAL_SERVER *Result);

/*
 * Destroy a MOC local server
 *
 * @LocalServer: Local server to destroy
 */
void LocalServerDestroy(MOC_LOCAL_SERVER *LocalServer);

#endif /* !LOCALSERVER_LOCALSERVER_H */
