#
# Copyright (C) 2018-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/lge/msm8998-common

# Platform
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

BOARD_USES_QCOM_HARDWARE := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8998
TARGET_BOARD_PLATFORM := msm8998
TARGET_BOARD_PLATFORM_GPU := qcom-adreno540
TARGET_HAS_NO_SELECT_BUTTON := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Android Verified Boot
BOARD_AVB_ENABLE := false

# Audio
BOARD_SUPPORTS_SOUND_TRIGGER_HAL := true
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true

# Audio - LGE
TARGET_DAC_PLUGIN_INCLUDE_DIR := $(COMMON_PATH)/include
BOARD_LGE_HAS_EXT_AMPLIFIER := true
BOARD_LGE_HAS_HIFI_QUAD_DAC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Camera
MALLOC_SVELTE_FOR_LIBC32 := true

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_ION := true
TARGET_USES_HWC2 := true
TARGET_USES_GRALLOC1 := true
TARGET_SCREEN_DENSITY := 540

# FM Radio
BOARD_HAS_QCA_FM_SOC := cherokee
BOARD_HAVE_QCOM_FM := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# Health
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH := /sys/class/power_supply/battery/battery_charging_enabled

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(COMMON_PATH)/framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_MATRIX_FILE += \
    hardware/qcom-caf/common/compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

# Init
TARGET_INIT_VENDOR_LIB := libinit_lge_msm8998
TARGET_RECOVERY_DEVICE_MODULES := libinit_lge_msm8998

# Kernel
BOARD_KERNEL_CMDLINE := user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 sched_enable_hmp=1
BOARD_KERNEL_CMDLINE += sched_enable_power_aware=1 service_locator.enable=1 swiotlb=2048
BOARD_KERNEL_CMDLINE += androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3
BOARD_KERNEL_CMDLINE += loop.max_part=7 androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.fstab_suffix=qcom
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/1da4000.ufshc
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/lge/msm8998
TARGET_KERNEL_VERSION := 4.4
TARGET_KERNEL_CLANG_VERSION := r416183b
TARGET_KERNEL_CLANG_PATH := $(abspath .)/prebuilts/clang/kernel/$(HOST_PREBUILT_TAG)/clang-$(TARGET_KERNEL_CLANG_VERSION)
TARGET_KERNEL_LLVM_BINUTILS := false

# Lights
TARGET_PROVIDES_LIBLIGHT := true
$(call soong_config_set,LGE_LIGHTS_HAL,INCLUDE_DIR,$(COMMON_PATH)/include)

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_CACHEIMAGE_PARTITION_SIZE := 536870912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 6157737984
BOARD_USERDATAIMAGE_PARTITION_SIZE := 119267606528
BOARD_FLASH_BLOCK_SIZE := 0x40000
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/firmware_mnt:/firmware

# Power
TARGET_RPM_MASTER_STAT := "/sys/kernel/debug/rpm_master_stats"
TARGET_WLAN_POWER_STAT := "/sys/kernel/debug/wlan0/power_stats"

# Recovery
BOOTLOADER_MESSAGE_OFFSET := 128
TARGET_RECOVERY_DENSITY := xxxhdpi

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
include device/qcom/sepolicy-legacy-um/SEPolicy.mk
include hardware/lge/sepolicy/SEPolicy.mk
include device/lineage/sepolicy/libperfmgr/sepolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/public

# Timeservice
BOARD_USES_QC_TIME_SERVICES := true

# Treble
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Vendor Security Patch level
VENDOR_SECURITY_PATCH := 2019-11-01

# Wifi
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
PRODUCT_VENDOR_MOVE_ENABLED := true

# inherit from the proprietary version
include vendor/lge/msm8998-common/BoardConfigVendor.mk
