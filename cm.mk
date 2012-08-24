## Device specific configuration
$(call inherit-product, device/samsung/tass/tass.mk)

## CyanogenMod stuff
$(call inherit-product, vendor/cm/config/gsm.mk)
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

## AOSP stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := GalaxyMini
PRODUCT_VERSION_DEVICE_SPECIFIC := -GT-S5570
-include vendor/cm/config/common_versions.mk

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := tass
PRODUCT_NAME := cm_tass

## Bootanimation
TARGET_BOOTANIMATION_NAME := 240
