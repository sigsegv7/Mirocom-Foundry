#
# Copyright (c) 2026 Mirocom Laboratories
# Provided under the BSD-3 clause
#

MISC_OFILES = $(shell find ../../ -name "*.o")
CFILES = $(shell find . -name "*.c")
OFILES = $(CFILES:.c=.o)
ASMFILES = $(shell find . -name "*.S")
ASMOFILES = $(ASMFILES:.S=.S.o)

KERN_BIN = ../../Mizion.sys

CFLAGS = 				\
	$(SYS_CFLAGS)		\
	-I../../../Target	\
	-D_KERNEL

.PHONY: all
all: $(ASMOFILES) $(OFILES)
	$(SYS_LD) $(MISC_OFILES) -TConfig/Link.lds -o $(KERN_BIN) $(LDFLAGS)

%.o: %.c
	$(SYS_CC) -c $(CFLAGS) $< -o $@

%.S.o: %.S
	$(SYS_CC) -c $(CFLAGS) $< -o $@
