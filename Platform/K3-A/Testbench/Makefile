#
# Copyright (c) 2026, Mirocom Laboratories
# Provided under the BSD-3 clause
#

SV_FILES = \
	$(shell find ../Rtl/ -name "*.sv")

TB_FILES =				\
	SocTest.cpp

.PHONY: all
all: obj vcd

.PHONY: obj
obj:
	verilator 				 \
		-Wall 				 \
		-DK3_SIM		 	 \
		--trace 			 \
		-cc 				 \
		-I../Rtl/Include	 \
		$(SV_FILES) 		 \
		--exe $(TB_FILES) 	 \
		--top-module Soc

.PHONY: vcd
vcd:
	make -C obj_dir/ -f VSoc.mk VSoc
	./obj_dir/VSoc
