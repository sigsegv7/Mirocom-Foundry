/*
 * Copyright (c) 2026, Mirocom Laboratories
 * Provided under the BSD-3 clause
 */

#include <stdio.h>
#include <unistd.h>

/* MOC version */
#define MOC_VERSION "0.0.1"

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

    return 0;
}
