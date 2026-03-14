//
// Copyright (c) 2026, Mirocom Laboratories
// Provided under the BSD-3 clause
//

//
// K3 System-on-Chip (SoC) package
//
// @Clk_i:      Clock input
// @Reset_i:    Reset input
//
module Soc (
    /* verilator lint_off UNUSEDSIGNAL */
    input wire Clk_i,
    input wire Reset_i
);
    logic Clk;
    logic Reset;
`ifndef K3_SIM
    logic PllLocked;

    // 320 MHz root clock domain
    pll RootPll (
        .refclk(Clk_i),
        .rst(~Reset_i),
        .outclk_0(Clk),
        .locked(PllLocked)
    );

    // Reset bridge
    always_ff @(posedge Clk) begin
        Reset <= ~Reset_i | ~PllLocked;
    end
`else
    assign Clk = Clk_i;
    assign Reset = ~Reset_i;
`endif  /* !_K3_SIM */
endmodule
