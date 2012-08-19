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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.

#
### This also includes proprietary files... this may change someday.
### TODO: Above line explains everything.
#

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
    libaudioutils

## Camera
PRODUCT_PACKAGES += \
    libcamera \
    camera.tass 

## Device specific
PRODUCT_PACKAGES += \
    lights.tass  

## GPS
PRODUCT_PACKAGES += \
    gps.tass \
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
    device/samsung/tass/ramdisk/ueventd.rc:root/ueventd.rc \
    device/samsung/tass/ramdisk/init.gt-s5570.rc:root/init.gt-s5570.rc \
    device/samsung/tass/ramdisk/init.rc:root/init.rc 

## Modules
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/lib/modules/zram.ko:system/lib/modules/zram.ko \
    device/samsung/tass/prebuilt/lib/modules/cifs.ko:system/lib/modules/cifs.ko \
    device/samsung/tass/prebuilt/lib/modules/tun.ko:system/lib/modules/tun.ko

## Ramdisk modules
PRODUCT_COPY_FILES += \
    device/samsung/tass/ramdisk/lib/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/tass/ramdisk/lib/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/tass/ramdisk/lib/modules/sec_param.ko:root/lib/modules/sec_param.ko

## Prebuilt init.d scripts
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/init.d/01bt:system/etc/init.d/01bt \
    device/samsung/tass/prebuilt/etc/init.d/02runonce:system/etc/init.d/02runonce

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

## ICS audio blob
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/lib/hw/audio.primary.tass.so:system/lib/hw/audio.primary.tass.so \
    device/samsung/tass/prebuilt/lib/hw/audio_policy.tass.so:system/lib/hw/audio_policy.tass.so

#
## Proprietary
# 

## Atheros AR6003 firmware
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/wifi/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/tass/prebuilt/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    device/samsung/tass/prebuilt/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/samsung/tass/prebuilt/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    device/samsung/tass/prebuilt/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.01:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.01 \
    device/samsung/tass/prebuilt/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.02:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.02 \
    device/samsung/tass/prebuilt/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.03:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.03 \
    device/samsung/tass/prebuilt/wifi/ath6k/AR6003/hw2.0/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/samsung/tass/prebuilt/wifi/ath6k/AR6003/hw2.0/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/samsung/tass/prebuilt/bin/hostapd:system/bin/hostapd \
    device/samsung/tass/prebuilt/bin/wlan_mac:system/bin/wlan_mac \
    device/samsung/tass/prebuilt/bin/wlan_tool:system/bin/wlan_tool \
    device/samsung/tass/prebuilt/bin/wmiconfig:system/bin/wmiconfig 

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

## Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/bin/BCM2049C0_003.001.031.0088.0094.hcd:system/bin/BCM2049C0_003.001.031.0088.0094.hcd \
    device/samsung/tass/prebuilt/etc/firmware/BCM2049C0_003.001.031.0088.0094.hcd:system/etc/firmware/BCM2049C0_003.001.031.0088.0094.hcd \

## GPS
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/bin/gpsd:system/bin/gpsd \
    device/samsung/tass/prebuilt/lib/hw/gps.tass.so:system/lib/hw/gps.tass.so

## GPU firmware and libraries
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/samsung/tass/prebuilt/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/samsung/tass/prebuilt/lib/libC2D2.so:system/lib/libC2D2.so \
    device/samsung/tass/prebuilt/lib/libgsl.so:system/lib/libgsl.so \
    device/samsung/tass/prebuilt/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/samsung/tass/prebuilt/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/samsung/tass/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    device/samsung/tass/prebuilt/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/samsung/tass/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/samsung/tass/prebuilt/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    device/samsung/tass/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/samsung/tass/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/samsung/tass/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so

## Sensor
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/bin/memsicd:system/bin/memsicd \
    device/samsung/tass/prebuilt/lib/hw/sensors.tass.so:system/lib/hw/sensors.tass.so \
    device/samsung/tass/prebuilt/lib/hw/lights.default.so:system/lib/hw/lights.default.so  

## RIL
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/bin/qmuxd:system/bin/qmuxd \
    device/samsung/tass/prebuilt/lib/ril/libdiag.so:system/lib/libdiag.so \
    device/samsung/tass/prebuilt/lib/ril/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/tass/prebuilt/lib/ril/libsecril-client.so:system/lib/libsecril-client.so

## OMX proprietaries
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/lib/omx/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxEvrcHwDec.so:system/lib/libOmxEvrcHwDec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxOn2Dec.so:system/lib/libOmxOn2Dec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxQcelpHwDec.so:system/lib/libOmxQcelpHwDec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/samsung/tass/prebuilt/lib/omx/libOmxWmvDec.so:system/lib/libOmxWmvDec.so 

## OMX shared
PRODUCT_COPY_FILES += \
    device/samsung/tass/prebuilt/lib/omx/shared/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
    device/samsung/tass/prebuilt/lib/omx/shared/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
    device/samsung/tass/prebuilt/lib/omx/shared/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
    device/samsung/tass/prebuilt/lib/omx/shared/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
    device/samsung/tass/prebuilt/lib/omx/shared/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
    device/samsung/tass/prebuilt/lib/omx/shared/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
    device/samsung/tass/prebuilt/lib/omx/shared/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \

# LDPI assets
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

# HardwareRenderer properties
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false

# Misc properties
PRODUCT_PROPERTY_OVERRIDES += \
    pm.sleep_mode=1
