#
# Copyright (C) 2015-2017 The Android Open-Source Project
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

DEVICE_PATH := device/motorola/cedric

TARGET_RECOVERY_DEVICE_DIRS := $(DEVICE_PATH)

# Architecture
TARGET_ARCH             := arm64
TARGET_ARCH_VARIANT     := armv8-a
TARGET_CPU_ABI          := arm64-v8a
TARGET_CPU_VARIANT      := cortex-a53
TARGET_2ND_ARCH         := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI      := armeabi-v7a
TARGET_2ND_CPU_ABI2     := armeabi
TARGET_2ND_CPU_VARIANT  := cortex-a53

TARGET_GLOBAL_CFLAGS    += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS  += -mfpu=neon -mfloat-abi=softfp

# Platform
TARGET_BOARD_PLATFORM       := msm8937
TARGET_BOARD_PLATFORM_GPU   := qcom-adreno505
TARGET_BOARD_SUFFIX         := _64

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME    := MSM8937
TARGET_NO_BOOTLOADER            := true

# EDL
TW_HAS_EDL_MODE := true

# Kernel
TARGET_KERNEL_ARCH          := arm64
TARGET_KERNEL_HEADER_ARCH   := arm64
BOARD_KERNEL_CMDLINE        := \
    androidboot.bootdevice=7824900.sdhci \
    androidboot.console=ttyHSL0 \
    androidboot.hardware=qcom \
    console=ttyHSL0,115200,n8 \
    earlycon=msm_hsl_uart,0x78B0000 \
    ehci-hcd.park=3 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    user_debug=30 \
    vmalloc=400M \
    androidboot.selinux=permissive
BOARD_KERNEL_BASE           := 0x80000000
BOARD_RAMDISK_OFFSET        := 0x01000000
BOARD_KERNEL_PAGESIZE       := 2048
KERNEL_TOOLCHAIN            := $(PWD)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin
KERNEL_TOOLCHAIN_PREFIX     := aarch64-linux-android-
TARGET_KERNEL_SOURCE        := kernel/motorola/msm8937
TARGET_KERNEL_CONFIG        := cedric_defconfig
BOARD_KERNEL_SEPARATED_DT   := true
TARGET_CUSTOM_DTBTOOL       := dtbTool_custom
BOARD_MKBOOTIMG_ARGS        := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_LZ4C_DT        := true
BOARD_DTBTOOL_ARGS          := --force-v3 --motorola 1
BOARD_KERNEL_IMAGE_NAME     := Image.gz

# Root filesystem
LZMA_RAMDISK_TARGETS := recovery

# Qualcomm support
BOARD_USES_QCOM_HARDWARE        := true
TARGET_RECOVERY_QCOM_RTC_FIX    := true

# File systems
BOARD_HAS_LARGE_FILESYSTEM  := true
TARGET_USERIMAGES_USE_EXT4  := true
TARGET_USERIMAGES_USE_F2FS  := true
TARGET_RECOVERY_FSTAB       := $(DEVICE_PATH)/recovery/root/etc/twrp.fstab
TW_INCLUDE_FUSE_EXFAT       := true # exFAT support
TW_INCLUDE_FUSE_NTFS        := true # NTFS support

# Partitions
BOARD_FLASH_BLOCK_SIZE              := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE      := 16777216    # mmcblk0p37
BOARD_CACHEIMAGE_PARTITION_SIZE     := 268435456   # mmcblk0p52
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 16879616    # mmcblk0p38
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 3623878656  # mmcblk0p53
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 10768858624 # mmcblk0p54

# Lun
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

# Security Patch
PLATFORM_SECURITY_PATCH := 2019-05-05

# SDCard
RECOVERY_SDCARD_ON_DATA = true

# Keymaster
TARGET_PROVIDES_KEYMASTER := true

# Encryption support
TARGET_HW_DISK_ENCRYPTION   := true
TW_INCLUDE_CRYPTO           := true
TARGET_CRYPTFS_HW_PATH      := $(DEVICE_PATH)/cryptfs_hw

# Brightness
TW_BRIGHTNESS_PATH                  := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS                   := 255
TW_DEFAULT_BRIGHTNESS               := 160

# Debug
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
    TWRP_INCLUDE_LOGCAT                 := true
    TARGET_USES_LOGD                    := true
    TWRP_EVENT_LOGGING                  := true
    TW_CRYPTO_SYSTEM_VOLD_DEBUG         := true
    # TODO: add strace and debuggerd binary or compile
    # TARGET_RECOVERY_DEVICE_MODULES      += strace debuggerd
    # TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_OPTIONAL_EXECUTABLES)/strace $(TARGET_OUT_OPTIONAL_EXECUTABLES)/debuggerd64
endif

# Screen
TARGET_RECOVERY_PIXEL_FORMAT        := "RGBX_8888"
TW_SCREEN_BLANK_ON_BOOT             := true

# Interface
TW_THEME                            := portrait_hdpi
TW_INPUT_BLACKLIST                  := "hbtp_vm" # Disable mouse cursor
RECOVERY_GRAPHICS_USE_LINELENGTH    := true
TW_NEW_ION_HEAP                     := true

# Language
TW_EXTRA_LANGUAGES                  := true

# Misc TWRP
BOARD_SUPPRESS_SECURE_ERASE         := true # don't take forever to wipe
BOARD_HAS_NO_SELECT_BUTTON          := true
TW_INCLUDE_FB2PNG                   := true
