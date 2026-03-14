#
# Copyright (c) 2026 Mirocom Laboratories
# Provided under the BSD-3 clause
#

MISC_OFILES = $(shell find ../../ -name "*.o")
ASMFILES = $(shell find . -name "*.S")
ASMOFILES = $(ASMFILES:.S=.S.o)

KERN_BIN = ../../Mizion.sys

CFLAGS = 				\
	$(SYS_CFLAGS)		\
	-D_KERNEL

.PHONY: all
all: $(ASMOFILES)
	$(SYS_LD) $(MISC_OFILES) -TConfig/Link.lds -o $(KERN_BIN) $(LDFLAGS)

%.S.o: %.S
	$(SYS_CC) -c $(CFLAGS) $< -o $@
