# Copyright (C) 2012 The Android Open Source Project
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

include $(CLEAR_VARS)

LOCAL_CFLAGS := -D_POSIX_SOURCE -Wno-multichar -g


ifneq ($(filter $(strip $(PLATFORM_VERSION)),5.0 5.1 6.0 6.0.1),)
ifneq ($(filter $(strip $(TARGET_PROVIDES_B2G_INIT_RC)),true),)
#for KAIOS
LOCAL_C_INCLUDES += \
    vendor/sprd/proprietories-source/engmode
else
#for Android
LOCAL_C_INCLUDES += \
    vendor/sprd/open-source/apps/engmode
endif
else
ifneq ($(filter $(strip $(PLATFORM_VERSION)),P 9 Q 10),)
LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/../AudioParamTester
else
LOCAL_C_INCLUDES += \
    vendor/sprd/proprietories-source/engmode
endif
endif

LOCAL_C_INCLUDES += \
    external/expat/lib \
    $(LOCAL_PATH)/../include


LOCAL_SRC_FILES := \
    string_exchange_bin.c

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libc \
    libcutils \
    liblog \
    libtinyalsa \
    libaudioutils \
    libexpat \
    libdl \
    libhardware_legacy

ifeq ($(strip $(AUDIO_RECORD_NR)),true)
LOCAL_CFLAGS += -DNRARRAY_ANALYSIS
endif

LOCAL_MODULE := libnvexchange

LOCAL_MODULE_TAGS := optional

ifneq ($(filter $(strip $(PLATFORM_VERSION)),P 9 Q 10),)
LOCAL_CFLAGS += -DAUDIOHAL_V4
endif

ifneq ($(filter $(strip $(PLATFORM_VERSION)),O 8.0.0 8.1.0 P 9 Q 10),)
LOCAL_CFLAGS += -DFLAG_VENDOR_ETC
LOCAL_PROPRIETARY_MODULE := true
endif

include $(BUILD_SHARED_LIBRARY)




