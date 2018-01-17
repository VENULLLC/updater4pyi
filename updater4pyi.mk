
# updater4pyi.mk
# Makefile to include building sqlobject in a larger top-level project
# Copyright (C) 2018 Long Range Systems, LLC.  All rights reserved.

ifndef UPDATER4PYI_SRC_DIR
  UPDATER4PYI_SRC_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
endif

ifndef BUILD_TOOLS_DIR
  ${error BUILD_TOOLS_DIR not defined! You must specify where build tools reside}
endif

# greenlet package version
UPDATER4PYI_PV = 1.4.1

# Build revision
UPDATER4PYI_PR = -r1

# Overall build version
UPDATER4PYI_BV = $(UPDATER4PYI_PV)$(UPDATER4PYI_PR)


UPDATER4PYI_DOTFILE = $(call python-cross-dotfile,updater4pyi,$(UPDATER4PYI_BV))

UPDATER4PYI_DEPS = $(UPDATER4PYI_DOTFILE)

$(UPDATER4PYI_DOTFILE): $(BUILD_PYTHON_NATIVE_MODULE_DEPS)
	$(call build-python-native-module,$(UPDATER4PYI_SRC_DIR))
	touch $@
