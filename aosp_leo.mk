# Inherit from the common Open Source product configuration
$(call inherit-product, device/nokia/leo/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_NAME := aosp_leo
PRODUCT_DEVICE := leo
PRODUCT_BRAND := nokia
PRODUCT_MODEL := Nokia 6300 4G
PRODUCT_MANUFACTURER := Nokia

$(call inherit-product-if-exists, vendor/nokia/leo/leo-vendor.mk)

PRODUCT_PACKAGES += \
    Launcher3 \

