//
// Copyright (c) 2026, Mirocom Laboratories
// Provided under the BSD-3 clause
//

//
// Description:
//      This header contains the packet definitions and type information
//      for the Mirocom Fast Platform Interconnect (FCI).
// Author:
//      Ian M. Moffett <ian@mirocom.org>
//

`ifndef BUS_FPI_H
`define BUS_FPI_H

//
// Represents the various kinds of packets that are capable of
// being understood on the Mirocom Fast Platform Interconnect
// (FCI).
//
// @FPI_KIND_INVALID:  This packet type is invalid
// @FPI_KIND_ROI:      Region offset interface packet
// @FPI_KIND_ROD:      Region offset data packet
//
typedef enum logic [7:0] {
    FPI_KIND_INVALID,
    FPI_KIND_ROI,
    FPI_KIND_ROD
} FpiPacketKind;

//
// Represents the various kinds of source/destination nodes
// for the Mirocom Fast Performance Interconnect (FCI).
//
// @FPI_NODE_INVALID: This node type is invalid
// @FPI_NODE_ROM:     This node is a platform ROM block
// @FPI_NODE_CORE:    This node is a processor core
//
typedef enum logic [7:0] {
    FPI_NODE_INVALID,
    FPI_NODE_ROM,
    FPI_NODE_CORE
} FpiNodeKind;

//
// Represents a Region Offset Interface (ROI) packet used to
// feed a region an offset relative to zero for a data operation
// to be performed.
//
// @RwOffset:  Offset used in read or write operation
// @WriteData: Data to be passed alongside a write (0 if WriteEn is unset)
// @WriteEn:   If set, operation is to be a write operation
// @Reserved:  Reserved, must be zero
//
typedef struct packed {
    logic [31:0]  RwOffset;
    logic [31:0]  WriteData;
    logic WriteEn;
    logic [63:0] Reserved;
} FpiRoiRequest;

//
// Represents a Region offset Data (ROD) response packet used
// to provide a requesting component with data at the offset
// given.
//
// @Data:       Data to be bundled with the respons
// @Reserved:   Reserved, must be zero
//
typedef struct packed {
    logic [31:0] Data;
    logic [94:0] Reserved;
} FpiRodResponse;

//
// Represents a Mirocom Fast Platform Interconnect (FCI)
// packet that can be sent over the bus.
//
// @Kind:       Packet kind
// @Source:     Packet source node
// @Dest:       Packet destination node
// @Sequence    Packet sequence number
// @SourceLeaf: Packet source instance
// @DestLeaf:   Packet destination instance
// @Payload:    Packet payload
//
typedef struct packed {
    FpiPacketKind Kind;
    FpiNodeKind Source;
    FpiNodeKind Dest;
    logic [15:0] Sequence;
    logic [7:0] SourceLeaf;
    logic [7:0] DestLeaf;
    logic [127:0] Payload;
} FpiPacket;

`endif
