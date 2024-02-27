LOCAL_PATH := device/nokia/leo

SRC_MEDIA_HAL_DIR := hardware/qcom/media/msm8909
SRC_DISPLAY_HAL_DIR := hardware/qcom/display/msm8909
SRC_CAMERA_HAL_DIR := hardware/qcom/camera/msm8909

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# this fixes build stopping because of missing header files
$(call inherit-product, hardware/qcom/msm8x09/msm8x09.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
  LOCAL_KERNEL := device/nokia/leo-kernel/zImage-dtb
else
  LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
    $(LOCAL_KERNEL):kernel

TARGET_KERNEL_ARCH := arm
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
# TARGET_KERNEL_CONFIG := LEO-perf_defconfig

# TARGET_KERNEL_SOURCE := kernel/msm-4.9
# Copy fstab and qcom boot files
PRODUCT_COPY_FILES += \
    device/nokia/leo/fstab.qcom:root/fstab.qcom \
    device/nokia/leo/rootdir/etc/init.qcom.rc:root/init.qcom.rc \
    device/nokia/leo/rootdir/etc/init.qcom.factory.rc:root/init.qcom.factory.rc \
    device/nokia/leo/rootdir/etc/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/nokia/leo/rootdir/etc/init.target.rc:root/ueventd.target.rc \
    device/nokia/leo/rootdir/etc/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    device/nokia/leo/rootdir/etc/init.qcom.rc:root/init.trace.rc

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

PRODUCT_AAPT_CONFIG := ldpi mdpi tvdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# disable treble?
PRODUCT_FULL_TREBLE_OVERRIDE := false

MSM_VIDC_TARGET_LIST := msm8909 # Get the color format from kernel headers
MASTER_SIDE_CP_TARGET_LIST := msm8909 # ION specific settings
