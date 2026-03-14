#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

include Mk/Default.mk

.PHONY: all
all: Toolchain Arch GenIso

.PHONY: GenIso
GenIso:
	cd Boot/Arch/$(ARCH)/; \
		./Host/GetDeps.sh; \
		./Host/GenIso.sh

.PHONY: Arch
Arch:
	cd Kernel/Arch/$(ARCH); make $(PASSDOWN_ARGS)

.PHONY: Toolchain
Toolchain:
	./Host/Toolchain.sh
