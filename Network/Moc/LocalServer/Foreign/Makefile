#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

CFILES = $(shell find . -name "*.c")
OFILES = $(CFILES:.c=.o)
DFILES = $(CFILES:.c=.d)

CC = gcc
CFLAGS = -MMD -pedantic -Wall -IInclude

.PHONY: all
all: $(OFILES)
	$(CC) $(OFILES) -o MocLocalServer

-include $(DFILES)
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

.PHONY: clean
clean:
	rm -f $(OFILES) $(DFILES)
