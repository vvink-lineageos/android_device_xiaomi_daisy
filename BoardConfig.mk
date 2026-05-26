#
# Copyright (C) 2018-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

TARGET_KERNEL_VERSION := 4.9

# Inherit from msm8953-common
include device/xiaomi/msm8953-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/daisy

# Camera
TARGET_SUPPORT_HAL1 := false

# Display
TARGET_SCREEN_DENSITY := 430

# Filesystem — system-as-root is default in Android 14, no flag needed
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := daisy_defconfig
# LK bootloader (Android One 8.1) never passes androidboot.force_normal_boot=1,
# so bake it in to prevent init from always entering recovery mode on normal boot.
BOARD_KERNEL_CMDLINE += androidboot.force_normal_boot=1

# Partitions
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55087422464

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/enable_dt2w"

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security Patch Level
VENDOR_SECURITY_PATCH := 2020-02-05

# Inherit the proprietary files
include vendor/xiaomi/daisy/BoardConfigVendor.mk
