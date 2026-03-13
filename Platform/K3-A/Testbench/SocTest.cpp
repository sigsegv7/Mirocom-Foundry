#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "VSoc.h"
#include "VSoc___024root.h"

#define MAX_SIM_ITER 100

int main(int argc, char** argv, char** env)
{
    VSoc *soc = new VSoc;

    Verilated::traceEverOn(true);
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    soc->trace(m_trace, 5);
    m_trace->open("soc.vcd");

    soc->Clk_i = 0;
    soc->Reset_i = 1;       /* ACTIVE-LOW */

    for (int i = 0; i < MAX_SIM_ITER; ++i) {
        soc->eval();
        m_trace->dump(i);

        switch (i) {
        case 0:
            /* Poll reset low */
            soc->Reset_i = 0;
            break;
        case 2:
            /* Release reset */
            soc->Reset_i ^= 1;
            break;
        }

        soc->Clk_i ^= 1;
    }

    m_trace->close();
    delete soc;
    return 0;
}
