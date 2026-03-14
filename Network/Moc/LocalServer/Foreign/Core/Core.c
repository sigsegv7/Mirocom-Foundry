/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

#include <stdio.h>
#include <unistd.h>
#include "LocalServer/Types.h"
#include "LocalServer/LocalServer.h"

/* MOC version */
#define MOC_VERSION "0.0.1"

/* Local server socket name */
#define LOCAL_SERVER_NAME "moc.local"

/*
 * Display the startup help menu
 */
static void
DisplayHelp(void)
{
    printf(
        "- Mirocom Oper Comms -\n"
        "----------------------------\n"
        "[-h] Display this help menu\n"
        "[-v] Display the version\n"
    );
}

/*
 * Display the version of MOC
 */
static void
DisplayVersion(void)
{
    printf(
        "---- Mirocom Oper Comms ----\n"
        "Copyright (c) Mirocom Laboratories\n"
        "Provided under the BSD-3 clause\n"
        "Version v%s\n",
        MOC_VERSION
    );
}

/*
 * Bring up the local server and begin listening
 * for connections.
 */
static INT32
ServerStart(void)
{
    MOC_LOCAL_SERVER LocalServer;
    INT32 Status;

    Status = LocalServerCreate(LOCAL_SERVER_NAME, &LocalServer);
    if (Status < 0) {
        return -1;
    }

    LocalServerDestroy(&LocalServer);
    return 0;
}

int
main(int argc, char **argv)
{
    int Opt;

    while ((Opt = getopt(argc, argv, "hv")) != -1) {
       switch (Opt)  {
       case 'h':
            DisplayHelp();
            return -1;
        case 'v':
            DisplayVersion();
            return -1;
       }
    }

    return ServerStart();
}
