#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

.PHONY: all
all: System Network Platform

.PHONY: System
System:
	cd System/; make

.PHONY: Network
Network:
	cd Network/; make

.PHONY: Platform
Platform:
	cd Platform/; make

.PHONY: clean
clean:
	cd Network/; make clean
