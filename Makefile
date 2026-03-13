#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

.PHONY: all
all: Network Platform

.PHONY: Network
Network:
	cd Network/; make

.PHONY: Platform
Platform:
	cd Platform/; make
