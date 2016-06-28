#
# Copyright (C) 2011 The CyanogenMod Project
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

# common msm8960 configs
$(call inherit-product, device/pantech/msm8960-common/msm8960.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/ramdisk/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.pantech.usb.rc:root/init.pantech.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/ramdisk/initlogo.rle:root/initlogo.rle

# vold config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab

# wifi config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf

# Wifi firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/WCNSS_cfg.dat:/system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/firmware/WCNSS_qcom_cfg_orgi.ini:/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg_orgi.ini \
    $(LOCAL_PATH)/firmware/WCNSS_qcom_cfg_trptis.ini:/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg_trptis.ini \
    $(LOCAL_PATH)/firmware/WCNSS_qcom_cfg_trptis.ini:/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/firmware/WCNSS_qcom_wlan_nv.bin:/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# thermald config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermald.conf:/system/etc/thermald.conf

# Audio firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/wcd9310_anc.bin:/system/etc/firmware/wcd9310/wcd9310_anc.bin \
    $(LOCAL_PATH)/firmware/wcd9310_mbhc.bin:/system/etc/firmware/wcd9310/wcd9310_mbhc.bin \

# DSP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/snd_soc_msm/snd_soc_msm:/system/etc/snd_soc_msm/snd_soc_msm \
    $(LOCAL_PATH)/configs/audio/snd_soc_msm/snd_soc_msm_2x:/system/etc/snd_soc_msm/snd_soc_msm_2x \
	$(LOCAL_PATH)/configs/audio/snd_soc_msm/snd_soc_msm_2x_Fusion3:/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 \
	$(LOCAL_PATH)/configs/audio/snd_soc_msm/snd_soc_msm_Sitar:/system/etc/snd_soc_msm/snd_soc_msm_Sitar \

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    $(LOCAL_PATH)/keylayout/qt602240_ts_input.kl:system/usr/keylayout/qt602240_ts_input.kl \
	$(LOCAL_PATH)/keylayout/qt602240_ts_input_ef45k.kl:system/usr/keylayout/qt602240_ts_input_ef45k.kl \
	$(LOCAL_PATH)/keylayout/qt602240_ts_input_ef46l.kl:system/usr/keylayout/qt602240_ts_input_ef46l.kl \
	$(LOCAL_PATH)/keylayout/qt602240_ts_input_ef47s.kl:system/usr/keylayout/qt602240_ts_input_ef47s.kl \
    $(LOCAL_PATH)/keylayout/Button_Jack.kl:system/usr/keylayout/Button_Jack.kl

# Input device config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/qwerty.idc:system/usr/idc/qwerty.idc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Camera
PRODUCT_PACKAGES += \
    libcameraservice

# Torch
PRODUCT_PACKAGES += \
    Torch

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += ko_KR xhdpi

# Telephony fixes
FRAMEWORKS_BASE_SUBDIRS += ../../$(LOCAL_PATH)/ril/

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
