#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from iEnglish3 device
$(call inherit-product, device/mid/iEnglish3/device.mk)

PRODUCT_DEVICE := iEnglish3
PRODUCT_NAME := omni_iEnglish3
PRODUCT_BRAND := K8 4G
PRODUCT_MODEL := K8 4G
PRODUCT_MANUFACTURER := mid

PRODUCT_GMS_CLIENTID_BASE := alps-full_mt8735b_3tb_n-{country}

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_mt8735b_3tb_n-user 7.0 NRD90M 1619079211 dev-keys"

BUILD_FINGERPRINT := iEnglish3/full_mt8735b_3tb_n/mt8735b_3tb_n:7.0/NRD90M/1619079211:user/dev-keys
