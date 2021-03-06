# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

# Stub sound_trigger HAL module, used for tests
include $(CLEAR_VARS)
LOCAL_C_INCLUDES += \
    external/tinyalsa/include

ifneq ($(filter $(strip $(PLATFORM_VERSION)),P 9 Q 10),)
LOCAL_HEADER_LIBRARIES += libhardware_headers
endif

LOCAL_MODULE := sound_trigger.primary.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := sound_trigger_hw.c
LOCAL_SHARED_LIBRARIES := liblog libcutils libtinyalsa
LOCAL_MODULE_TAGS := optional
LOCAL_32_BIT_ONLY := true
ifneq ($(filter $(strip $(PLATFORM_VERSION)),O 8.0.0 8.1.0 P 9 Q 10),)
LOCAL_PROPRIETARY_MODULE := true
LOCAL_CFLAGS += -DFLAG_VENDOR_ETC
endif
include $(BUILD_SHARED_LIBRARY)

#include $(CLEAR_VARS)
#LOCAL_MODULE            := SMicTD1.dat
#LOCAL_MODULE_FILENAME   := SMicTD1.dat
#LOCAL_MODULE_TAGS       := optional
#LOCAL_MODULE_CLASS      := firmware
#LOCAL_MODULE_PATH       := $(TARGET_OUT_ETC)/firmware
#LOCAL_SRC_FILES         := SMicTD1.dat
#include $(BUILD_PREBUILT)


#include $(CLEAR_VARS)
#LOCAL_MODULE            := SMicBin.dat
#LOCAL_MODULE_FILENAME   := SMicBin.dat
#LOCAL_MODULE_TAGS       := optional
#LOCAL_MODULE_CLASS      := firmware
#LOCAL_MODULE_PATH       := $(TARGET_OUT_ETC)/firmware
#LOCAL_SRC_FILES         := SMicBin.dat
#include $(BUILD_PREBUILT)
