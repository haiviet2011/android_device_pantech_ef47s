# Copyright (C) 2009 The Android Open Source Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

COMMON_GLOBAL_CFLAGS += -DEF47S -DNEED_UMS_ENABLE

# inherit from common msm8960
-include device/pantech/msm8960-common/BoardConfigCommon.mk

TARGET_KERNEL_CONFIG := cm_ef47s_defconfig

# Init
#TARGET_PROVIDES_INIT_RC := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/pantech/ef47s/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Bluetooth
TARGET_CUSTOM_BLUEDROID := ../../../device/pantech/ef47s/bluetooth/bluetooth.c

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

# Kernel
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom androidboot.carrier=SKT-KOR user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2 loglevel=0
BOARD_MKBOOTIMG_ARGS := 0x82400000

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/pantech/ef47s/vibrator/vibrator.c

# QCOM GPS
#BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := ef47s

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 9437184
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 8589934592
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_MAX_PARTITIONS := 33

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/pantech/ef47s/recovery/recovery_keys.c
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SUPPRESS_EMMC_WIPE := true
# Recovery Graphics fix
RECOVERY_GRAPHICS_USE_LINELENGTH := true

# cm-10.1 commit by Mir (lucidos team)
TARGET_ARCH := arm

# TWRP
TARGET_RECOVERY_INITRC :=
DEVICE_RESOLUTION := 720x1280
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_CUSTOM_POWER_BUTTON := 116
