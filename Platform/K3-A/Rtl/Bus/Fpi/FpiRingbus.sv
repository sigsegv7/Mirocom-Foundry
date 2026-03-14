//
// Copyright (c) 2026, Mirocom Laboratories
// Provided under the BSD-3 clause
//

//
// Description:
//      This module implements a ringbus which acts as a data
//      transport link between ringstops. There can be multiple
//      rings for varying purposes to reduce congestion.
// Author:
//      Ian M. Moffett <ian@mirocom.org>
//

`include "Bus/Fpi.svh"

//
// On-chip ringbus
//
// @Clk_i:          Clock input
// @Reset_i:        Reset input
// @Seg0Lip_i:      Segment 0 link injection port
// @Seg1Lip_i:      Segment 1 link injection port
// @Seg0Ready_o:    Segment 0 link injection port ready
// @Seg1Ready_o:    Segment 1 link injection port ready
//
module FpiRingbus (
    input wire Clk_i,
    input wire Reset_i,
    input FpiPacket Seg0Lip_i,
    input FpiPacket Seg1Lip_i,

    output logic Seg0Ready_o,
    output logic Seg1Ready_o
);
    FpiPacket Seg0Feed;
    FpiPacket Seg1Feed;

    // Ring segment 0
    FpiRingstop Segment0 (
        .Clk_i(Clk_i),
        .Reset_i(Reset_i),
        .Link_i(Seg0Feed),
        .Lip_i(Seg0Lip_i),
        .Link_o(Seg1Feed),
        .Ready_o(Seg0Ready_o)
    );

    // Ring segment 1
    FpiRingstop Segment1 (
        .Clk_i(Clk_i),
        .Reset_i(Reset_i),
        .Link_i(Seg1Feed),
        .Lip_i(Seg1Lip_i),
        .Link_o(Seg0Feed),
        .Ready_o(Seg1Ready_o)
    );
endmodule
