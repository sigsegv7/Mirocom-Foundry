#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

include Mk/Default.mk

.PHONY: all
all: Target Toolchain Kernel Arch GenIso

.PHONY: Target
Target:
	mkdir -p Target/Machine/
	rsync -avr Kernel/Include/Arch/$(ARCH)/*.h Target/Machine

.PHONY: GenIso
GenIso:
	cd Boot/Arch/$(ARCH)/; \
		./Host/GetDeps.sh; \
		./Host/GenIso.sh

.PHONY: Kernel
Kernel:
	cd Kernel/Core/; make $(PASSDOWN_ARGS)

.PHONY: Arch
Arch:
	cd Kernel/Arch/$(ARCH); make $(PASSDOWN_ARGS)

.PHONY: Toolchain
Toolchain:
	./Host/Toolchain.sh

.PHONY: clean
clean:
	cd Kernel/Arch/$(ARCH); make clean
