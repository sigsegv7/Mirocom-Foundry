#
# Copyright (c) 2026 Mirocom Laboratories
# Provided under the BSD-3 clause
#

CFILES = $(shell find . -name "*.c")
DFILES = $(CFILES:.c=.d)
OFILES = $(CFILES:.c=.o)

CFLAGS = 					\
	$(SYS_CFLAGS) 			\
	-I../Include			\
	-I../../Sdk/Include/	\
	-D_KERNEL				\
	-MMD					\
	-DPRINTF_DISABLE_SUPPORT_PTRDIFF_T \
	-DPRINTF_DISABLE_SUPPORT_FLOAT

.PHONY: all
all: $(OFILES)

-include $(DFILES)
%.o: %.c
	$(SYS_CC) -c $(CFLAGS) $< -o $@
