#
# Copyright (C) 2018-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter h930 h932 us998 joan,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

# builds require us to create the mount points at compile time.
# Just creating it for all cases since it does not hurt.
FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/firmware_mnt
$(FIRMWARE_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/firmware_mnt

DSP_MOUNT_POINT := $(TARGET_OUT_VENDOR)/dsp
$(DSP_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(DSP_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/dsp

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MOUNT_POINT) $(DSP_MOUNT_POINT)
# END Vendor mounts

# Create a link for the WCNSS MAC firmware, which ends up as a writable
# version in /data/misc/wifi
# Wifi
BDWLAN_IMAGES := \
    bdwlan.bin bdwlan_ch0.bin bdwlan_ch1.bin

BDWLAN_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/,$(notdir $(BDWLAN_IMAGES)))
$(BDWLAN_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "BDWLAN firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/etc/wifi/$(notdir $@) $@

WCNSS_INI_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini
$(WCNSS_INI_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS config ini link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/etc/wifi/$(notdir $@) $@

WCNSS_MAC_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/wlan_mac.bin
$(WCNSS_MAC_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS MAC bin link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /mnt/vendor/persist-lg/wifi/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WCNSS_INI_SYMLINK) $(WCNSS_MAC_SYMLINK) $(BDWLAN_SYMLINKS)
# END Wifi
endif
