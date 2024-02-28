# borrowed from zte draco twrp dts
# edited 26.Jan 2024 by Llixuma
# Copyright (C) 2018 The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := device/nokia/leo

# Platform
BOARD_VENDOR := nokia
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_SOC := msm8909
TARGET_BOARD_PLATFORM := msm8909
TARGET_BOOTLOADER_BOARD_NAME := leo
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Architecture
BOARD_USES_ADRENO := true
BOARD_USES_QCOM_HARDWARE := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI),$(TARGET_CPU_ABI2)
TARGET_CPU_VARIANT := cortex-a7

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET := 0x02000000

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7824900.sdhci
BOARD_KERNEL_CMDLINE += earlyprintk earlycon=msm_hsl_uart,0x78B0000
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive enforcing=0
BOARD_KERNEL_CMDLINE += androidboot.dm_verity=disabled

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

BOARD_HAVE_BLUETOOTH := true

# Display
BOARD_USES_ADRENO := true
HAVE_ADRENO_SOURCE:= false
TW_ROTATION := 0
DEVICE_RESOLUTION := 240x320
TARGET_SCREEN_WIDTH := 240
TARGET_SCREEN_HEIGHT := 320

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2566897152
TARGET_USERIMAGES_USE_EXT4 := true


TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

USE_OPENGL_RENDERER := true

BOARD_EGL_CFG := device/nokia/leo/configs/egl.cfg
