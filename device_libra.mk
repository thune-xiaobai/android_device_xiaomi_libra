$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/xiaomi/libra/libra-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/xiaomi/libra/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/xiaomi/libra/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/xiaomi/libra/dt.img:dt.img

#$(call inherit-product, build/target/product/full.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

PRODUCT_NAME := full_libra
PRODUCT_DEVICE := libra
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Mi-4c

# Init scripts
PRODUCT_PACKAGES += \
	init.class_main.sh \
	init.mdm.sh \
	init.qcom.class_core.sh \
	init.qcom.early_boot.sh	\
	init.qcom.factory.sh \
	init.qcom.sh \
	init.qcom.syspart_fixup.sh \
	init.qcom.usb.sh \
	init.qcom.rc \
	init.qcom.usb.cdrom.rc \
	init.qcom.usb.rc \
	init.recovery.hardware.rc \
	init.target.rc \
	init.usb.rc \
	ueventd.goldfish.rc \
	ueventd.qcom.rc

