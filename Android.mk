# Added on 26.Jan.2024
# Llixuma
#
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),leo)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
