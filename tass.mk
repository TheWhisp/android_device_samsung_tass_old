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

# Proprietary stuff
$(call inherit-product, vendor/samsung/tass/tass-vendor.mk)
# GPS configuratipm
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
DEVICE_PACKAGE_OVERLAYS += device/samsung/tass/overlay

## Media
PRODUCT_PACKAGES += \
    libOmxCore \
    libmm-omxcore \
    libstagefrighthw 

## Display
PRODUCT_PACKAGES += \
    gralloc.msm7x27 \
    hwcomposer.msm7x27 \
    copybit.msm7x27 \
    libQcomUI \
    libgenlock \
    liboverlay \
    libtilerenderer 

## Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.tass \
    audio_policy.tass \
    libaudioutils

## Camera
PRODUCT_PACKAGES += \
    libcamera \
    camera.tass \
    LegacyCamera 

## GPS
PRODUCT_PACKAGES += \
    librpc 
  
## Other
PRODUCT_PACKAGES += \
    make_ext4fs \
    brcm_patchram_plus \
    bdaddr_read \
    setup_fs  

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/vold.fstab:system/etc/vold.fstab

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/tass/initramfs/ueventd.tass.rc:root/ueventd.tass.rc \
    device/samsung/tass/initramfs/init.tass.rc:root/init.tass.rc \
    device/samsung/tass/initramfs/lib/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/tass/initramfs/lib/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/tass/initramfs/lib/modules/sec_param.ko:root/lib/modules/sec_param.ko

## Prebuilt init.d scripts
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/init.d/01bt:system/etc/init.d/01bt 

## MAC Address
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs

## Wi-Fi config
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/tass/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/tass/prebuilt/etc/wifi/dhcpcd.conf:system/etc/wifi/dhcpcd.conf \
    device/samsung/tass/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

## Media
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/tass/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/tass/prebuilt/etc/audio_effects.conf:system/etc/audio_effects.conf \
    device/samsung/tass/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf \
    device/samsung/tass/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/tass/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/samsung/tass/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \

## Keymap
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/tass/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/tass/prebuilt/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/tass/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/tass/prebuilt/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl 

## Keychar
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/usr/keylayout/qwerty.kcm:system/usr/keylayout/qwerty.kcm \
    device/samsung/tass/prebuilt/usr/keylayout/qwerty2.kcm:system/usr/keylayout/qwerty2.kcm \
    device/samsung/tass/prebuilt/usr/keylayout/Virtual.kcm:system/usr/keylayout/Virtual.kcm \
    device/samsung/tass/prebuilt/usr/keylayout/Generic.kcm:system/usr/keylayout/Generic.kcm

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

## ICS GPS blob
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/lib/hw/gps.tass.so:system/lib/hw/gps.tass.so

# LDPI assets
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

# Build.prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false
    pm.sleep_mode=1
