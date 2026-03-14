#
# Copyright (c) 2026 Mirocom Laboratories
# Provided under the BSD-3 clause
#

ARCH = \
	x86_64
CC = \
	$(shell pwd)/Var/cc/gcc/bin/$(ARCH)-pc-mirocom-gcc
LD = \
    $(shell pwd)/Var/cc/toolchain/build-binutils/bin/$(ARCH)-pc-mirocom-ld
AR = \
	$(shell pwd)/Var/cc/toolchain/build-binutils/bin/$(ARCH)-pc-mirocom-ar

SYS_CFLAGS =			\
	-nostdlib			\
	-nostdinc			\
	-ffreestanding		\
	-fexceptions		\
	--std=gnu11			\
	-mcmodel=kernel		\
	-Wno-attributes		\
	-fno-stack-protector\
	-D_GNOSOS_MULTICORE

ifeq ($(ARCH_TARGET),x86_64)
	SYS_CFLAGS += 		\
		-mno-sse		\
		-mno-sse2		\
		-mno-sse3		\
		-mno-avx		\
		-mno-avx2		\
		-mno-80387		\
		-mno-3dnow		\
		-mno-mmx
endif

PASSDOWN_ARGS = \
	ARCH=$(ARCH)			\
	SYS_CC=$(CC)			\
	SYS_LD=$(LD)			\
	SYS_CFLAGS="$(SYS_CFLAGS)"
