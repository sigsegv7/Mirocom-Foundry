//
// Copyright (c) 2026, Mirocom Laboratories
// Provided under the BSD-3 clause
//

//
// Description:
//      This module implements "ringstops for the Mirocom"
//      Fast Platform Interconnect (FPI).
// Author:
//      Ian M. Moffett <ian@mirocom.org>
//

`include "Bus/Fpi.svh"

//
// A ringstop is a segment within a transport ring that performs
// minimal routing and arbitration between other segments.
//
// @Clk_i:   Clock input
// @Reset_i: Reset input
// @Link_i:  Inbound transport link
// @Lip_i:   Link injection port
// @Link_o:  Outbound transport link
//
module FpiRingstop #(
    parameter MUX_PERIOD = 2,
    parameter MUX_INPUT_COUNT = 2,
    parameter MUX_MAX = (MUX_PERIOD * MUX_INPUT_COUNT)
) (
    input wire Clk_i,
    input wire Reset_i,
    input FpiPacket Link_i,
    input FpiPacket Lip_i,

    output FpiPacket Link_o
);
    module [3:0] MuxSel;

    //
    // Splice the transport link injection port with the inbound
    // transport link with a 2 cycle period.
    //
    always_ff @(posedge Clk_i) begin
        if (Reset_i) begin
            MuxSel <= 0;
        end else begin
            case (MuxSel)
                // TDM slice 0
                0: Link_o <= Link_i;
                1: Link_o <= Link_i;

                // TDM slice 1
                2: Link_o <= Lip_i;
                3: Link_o <= Lip_i;
            endcase

            // Bump and wrap if needed
            if (MuxSel < MUX_MAX - 1) begin
                MuxSel <= MuxSel + 1;
            end else begin
                MuxSel <= 0;
            end
        end
    end
endmodule
