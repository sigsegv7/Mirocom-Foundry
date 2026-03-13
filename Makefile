#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

.PHONY: all
all: Platform

.PHONY: Platform
Platform:
	cd Platform/; make
