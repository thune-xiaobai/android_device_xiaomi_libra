LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := healthd_board_p1.cpp
LOCAL_MODULE := libhealthd.$(TARGET_BOARD_PLATFORM)
LOCAL_CFLAGS := -Werror
LOCAL_C_INCLUDES := system/core/healthd
include $(BUILD_STATIC_LIBRARY)
