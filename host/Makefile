################################################
#
# Makefile to Manage ->
# DE10-Nano Programming FPGA from HPS Project
#
# Nicolas Hasbún A.
# nhasbun@gmail.com
# 12-05-2018 (dd-mm-yyyy)
#
################################################

## DEFINE TARGET AND SOURCE CODE

## ALTERA INFO
ALT_DEVICE_FAMILY ?= soc_cv_av
HWLIBS_ROOT = ./intel-socfpga-hwlib/armv7a/hwlib/

## COMPILER FLAGS
CFLAGS = -g -std=c99 -Wall -Werror -I$(HWLIBS_ROOT)/include -I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY) -D$(ALT_DEVICE_FAMILY)
CPPFLAGS = -I$(HWLIBS_ROOT)/include -I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY) -D$(ALT_DEVICE_FAMILY)

CC = arm-linux-gnueabihf-gcc
CPP = arm-linux-gnueabihf-g++

.PHONY: all
all: clean build host

build:
	rm -f program   
	$(CC) $(CFLAGS) main.c -o program

host:
	rm -f host_c*
	$(CC) $(CFLAGS) host.c -o host_c
	$(CPP) $(CPPFLAGS) host.cpp -o host_cpp 

clean:
	rm -f program host_c*
	rm -rf __pycache__

dtb_install:
	cp DE10_NANO.rbf /lib/firmware/
	dtbocfg.rb --install soc_system --dts soc_system.dts

dtb_uninstall:
	dtbocfg.rb --remove soc_system
	rm -f /lib/firmware/DE10_NANO.rbf
