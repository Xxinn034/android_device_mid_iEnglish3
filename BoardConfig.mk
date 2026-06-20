#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/mid/iEnglish3

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_USES_64_BIT_BINDER := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := K8 4G
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 160

# Kernel
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_KERNEL_TAGS_OFFSET := 0x0e000000
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := iEnglish3_defconfig
TARGET_KERNEL_SOURCE := kernel/mid/iEnglish3

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 14505984
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 14505984
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM := mt6737m

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration (保留 MTP 和 ADB)
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true          # 使用 toolbox 替代 busybox，大幅减小体积

# ========== 极致精简 TWRP（保留 MTP 和 ADB）==========
# 移除 TWRP App、SuperSU、注入功能、截图、NTFS、Dumlock
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_INJECTTWRP := true
TW_EXCLUDE_FB2PNG := true
TW_EXCLUDE_NTFS_3G := true
TW_EXCLUDE_DUMLOCK := true

# 移除 Bash、Nano、Busybox、zip、pigz 等大型工具
TW_EXCLUDE_BASH := true
TW_EXCLUDE_NANO := true
TW_EXCLUDE_BUSYBOX := true
TW_EXCLUDE_ZIP := true
TW_EXCLUDE_PIGZ := true
TW_EXCLUDE_OPENSSL := true      # 若 pigz 依赖 openssl，一并排除

# 移除加密支持（若你不需要解密 data 分区，可大幅减小体积）
# 如果需要解密，请注释掉下面这行
TW_EXCLUDE_CRYPTO := true

# 移除 exFAT 和 F2FS 支持（如果你不需要这些文件系统）
TW_NO_EXFAT := true
TW_NO_F2FS := true

# 对应的 INCLUDE 设为 false (确保覆盖默认)
TW_INCLUDE_TWRPAPP := false
TW_INCLUDE_SUPERSU := false
TW_INCLUDE_INJECTTWRP := false
TW_INCLUDE_FB2PNG := false
TW_INCLUDE_NTFS_3G := false
TW_INCLUDE_DUMLOCK := false
TW_INCLUDE_BASH := false
TW_INCLUDE_NANO := false
TW_INCLUDE_BUSYBOX := false
TW_INCLUDE_PIGZ := false

# 尝试覆盖 PRODUCT_PACKAGES (某些版本支持)
PRODUCT_PACKAGES := $(filter-out busybox bash nano pigz openaes twrpapp, $(PRODUCT_PACKAGES))

# 使用 LZMA 压缩 ramdisk（比 LZ4 压缩率更高，体积更小）
# 注释掉 LZ4，启用 LZMA
# BOARD_RAMDISK_USE_LZ4 := true
LZMA_RAMDISK_TARGETS := recovery

# ====================================================
