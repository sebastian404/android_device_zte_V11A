$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/V11A/V11A-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/V11A/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zte/V11A/recovery_kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel\
    device/zte/V11A/recovery/etc/usb.conf:/root/usb.conf
    
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := generic_V11A
PRODUCT_DEVICE := V11A
PRODUCT_BRAND := zte

pathmap_INCL := recovery:device/zte/V11A/recovery

