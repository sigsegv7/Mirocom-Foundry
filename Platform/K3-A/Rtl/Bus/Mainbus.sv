//
// Copyright (c) 2026, Mirocom Laboratories
// Provided under the BSD-3 clause
//

//
// Description:
//      This module implements the on-chip Mainbus which relies
//      on the Mirocom FPI fabric.
// Author:
//      Ian M. Moffett <ian@mirocom.org>
//

`include "Bus/Fpi.svh"

//
// On-chip mainbus
//
// @Clk_i:      Clock input
// @Reset_i:    Reset input
//
module Mainbus (
    input wire Clk_i,
    input wire Reset_i
);
    // Data segment LIP feeders
    FpiPacket DataSeg0Lip0;
    FpiPacket DataSeg1Lip0;

    FpiRingbus RequestRing (
        .Clk_i(Clk_i),
        .Reset_i(Reset_i),
        .Seg0Lip_i(DataSeg0Lip0),
        .Seg1Lip_i(DataSeg1Lip0)
    );

    always_ff @(posedge Clk_i) begin
        if (Reset_i) begin
            DataSeg0Lip0 <= 0;
            DataSeg1Lip0 <= 0;
        end
    end
endmodule
