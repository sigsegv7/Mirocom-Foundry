/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

/*
 * Description:
 *      This module implements the server-side interface
 *      routines for the MOC server-side.
 * Author:
 *      Ian M. Moffett <ian@mirocom.org>
 */

#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include "LocalServer/Common.h"
#include "LocalServer/LocalServer.h"
#include "LocalServer/Types.h"

INT32
LocalServerCreate(const char *Name, MOC_LOCAL_SERVER *Result)
{
    struct pollfd *PollList = NULL;
    struct sockaddr_un DomainSocket;
    USIZE NameLength;
    int SocketFd, Status;

    if (Name == NULL || Result == NULL) {
        errno = -EINVAL;
        return -1;
    }

    BZERO(Result, sizeof(*Result));
    BZERO(Result->PollList, sizeof(Result->PollList));
    BZERO(&DomainSocket, sizeof(DomainSocket));

    /* Truncate the length if needed */
    NameLength = STRLEN(Name);
    if (NameLength > sizeof(Result->ServerName) - 1) {
        NameLength = sizeof(Result->ServerName) - 1;
    }

    /* Create the socket */
    MEMCPY(Result->ServerName, Name, NameLength);
    SocketFd = socket(AF_LOCAL, SOCK_STREAM, 0);
    if (SocketFd < 0) {
        perror("socket");
        return -1;
    }

    /* Initialize the domain socket */
    DomainSocket.sun_family = AF_LOCAL;
    snprintf(
        DomainSocket.sun_path,
        sizeof(DomainSocket.sun_path),
        "/tmp/%s.sock",
        Result->ServerName
    );

    /* Bind the domain socket */
    Status = bind(
        SocketFd,
        (struct sockaddr *)&DomainSocket,
        sizeof(DomainSocket)
    );

    if (Status < 0) {
        perror("bind");
        close(SocketFd);
        return -1;
    }

    /* Mark the socket as listening */
    Status = listen(SocketFd, LISTEN_BACKLOG);
    if (Status < 0) {
        perror("listen");
        close(SocketFd);
        return -1;
    }

    /* Initialize the poll list */
    PollList = &Result->PollList[0];
    PollList[0].fd = SocketFd;
    PollList[0].events = POLLIN;

    Result->SocketFd = SocketFd;
    return 0;
}

void
LocalServerDestroy(MOC_LOCAL_SERVER *LocalServer)
{
    char NameBuffer[64];

    if (LocalServer == NULL) {
        return;
    }

    close(LocalServer->SocketFd);
    LocalServer->SocketFd = -1;

    /* Grab the socket path */
    snprintf(
        NameBuffer,
        sizeof(NameBuffer),
        "/tmp/%s.sock",
        LocalServer->ServerName
    );

    /* Delete the socket file */
    remove(NameBuffer);
}
