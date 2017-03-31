LOCAL_PATH := $(call my-dir)

# progs
# ======================

CFLAGS  := -O2 -W -Wall
LDFLAGS :=

PKGCONFIG ?= $(shell pkg-config --exists libusb-1.0 && echo 1)

ifeq ($(PKGCONFIG),1)
CFLAGS  += $(shell pkg-config --cflags libusb-1.0)
LDFLAGS += $(shell pkg-config --libs libusb-1.0)
else ifdef LIBUSB
CFLAGS  += -I$(LIBUSB)/include
LDFLAGS += -L$(LIBUSB)/lib
else
CFLAGS  += -I/usr/include/libusb-1.0
LDFLAGS += -lusb-1.0
endif


include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkcrc.c
LOCAL_MODULE := rkcrc
LOCAL_CFLAGS := $(CFLAGS)
LOCAL_LDFLAGS := $(LDFLAGS)
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkflashtool.c
LOCAL_MODULE := rkflashtool
LOCAL_CFLAGS := $(CFLAGS)
LOCAL_LDFLAGS := $(LDFLAGS)
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkunpack.c
LOCAL_MODULE := rkunpack
LOCAL_CFLAGS := $(CFLAGS)
LOCAL_LDFLAGS := $(LDFLAGS)
include $(BUILD_HOST_EXECUTABLE)


CFLAGS  :=
LDFLAGS :=

PKGCONFIG :=


# scripts
# ======================

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkunsign
LOCAL_MODULE := rkunsign
LOCAL_REQUIRED_MODULES := rkpad
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkparametersblock
LOCAL_MODULE := rkparametersblock
LOCAL_REQUIRED_MODULES := rkcrc
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkmisc
LOCAL_MODULE := rkmisc
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkpad
LOCAL_MODULE := rkpad
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkparameters
LOCAL_MODULE := rkparameters
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true
include $(BUILD_PREBUILT)
