#
# Copyright (C) 2016 The Android Open-Source Project
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

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Specify phone tech before including full_phone
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)


# Define version
TW_DEVICE_VERSION := 2

# Screen density
PRODUCT_AAPT_CONFIG         := normal
PRODUCT_AAPT_PREF_CONFIG    := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT    := 1920
TARGET_SCREEN_WIDTH     := 1080

# Encryption
PRODUCT_PACKAGES += \
    libcryptfs_hw

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Time Zone data for recovery
PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# sdcardfs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE          := cedric
PRODUCT_NAME            := omni_cedric
PRODUCT_MODEL           := Moto G5
PRODUCT_BRAND           := Motorola
PRODUCT_MANUFACTURER    := Motorola
BOARD_VENDOR            := motorola
