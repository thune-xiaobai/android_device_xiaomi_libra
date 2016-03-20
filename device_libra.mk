$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/xiaomi/libra/libra-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/xiaomi/libra/overlay

TARGET_OTA_ASSERT_DEVICE := 4C,libra

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

#PRODUCT_COPY_FILES += \
    device/xiaomi/libra/kernel:kernel \
    device/xiaomi/libra/dt.img:dt.img

#chargeonlymode
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/sbin/chargeonlymode:root/sbin/chargeonlymode

#media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

#acdbdata
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/acdbdata/Forte/Forte_Bluetooth_cal.acdb:system/etc/acdbdata/Forte/Forte_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/acdbdata/Forte/Forte_Handset_cal.acdb:system/etc/acdbdata/Forte/Forte_Handset_cal.acdb \
    $(LOCAL_PATH)/acdbdata/Forte/Forte_Speaker_cal.acdb:system/etc/acdbdata/Forte/Forte_Speaker_cal.acdb \
    $(LOCAL_PATH)/acdbdata/Forte/Forte_General_cal.acdb:system/etc/acdbdata/Forte/Forte_General_cal.acdb \
    $(LOCAL_PATH)/acdbdata/Forte/Forte_Hdmi_cal.acdb:system/etc/acdbdata/Forte/Forte_Hdmi_cal.acdb \
    $(LOCAL_PATH)/acdbdata/Forte/Forte_Global_cal.acdb:system/etc/acdbdata/Forte/Forte_Global_cal.acdb \
    $(LOCAL_PATH)/acdbdata/Forte/Forte_Headset_cal.acdb:system/etc/acdbdata/Forte/Forte_Headset_cal.acdb

#audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml \
    $(LOCAL_PATH)/audio/surround_sound_3mic/surround_sound_rec_AZ.cfg:system/etc/surround_sound_3mic/surround_sound_rec_AZ.cfg

#permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/cneapiclient.xml:system/etc/permissions/cneapiclient.xml \
    $(LOCAL_PATH)/permissions/com.qti.snapdragon.sdk.display.xml:system/etc/permissions/com.qti.snapdragon.sdk.display.xml \
    $(LOCAL_PATH)/permissions/com.qualcomm.location.vzw_library.xml:system/etc/permissions/com.qualcomm.location.vzw_library.xml \
    $(LOCAL_PATH)/permissions/com.qualcomm.location.xml:system/etc/permissions/com.qualcomm.location.xml \
    $(LOCAL_PATH)/permissions/com.quicinc.cne.xml:system/etc/permissions/com.quicinc.cne.xml \
    $(LOCAL_PATH)/permissions/dpmapi.xml:system/etc/permissions/dpmapi.xml \
    $(LOCAL_PATH)/permissions/embms.xml:system/etc/permissions/embms.xml \
    $(LOCAL_PATH)/permissions/interface_permissions.xml:system/etc/permissions/interface_permissions.xml \
    $(LOCAL_PATH)/permissions/qcnvitems.xml:system/etc/permissions/qcnvitems.xml \
    $(LOCAL_PATH)/permissions/qcrilhook.xml:system/etc/permissions/qcrilhook.xml \
    $(LOCAL_PATH)/permissions/qti_permissions.xml:system/etc/permissions/qti_permissions.xml

#Sensor
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensor/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \
    $(LOCAL_PATH)/sensor/sensor_diag.cfg:system/etc/sensor_diag.cfg

#keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ft5x46.kl:system/usr/keylayout/ft5x46.kl \
    $(LOCAL_PATH)/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/atmel-maxtouch.kl:system/usr/keylayout/atmel-maxtouch.kl \
    $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/synaptics_dsx_edge.kl:system/usr/keylayout/synaptics_dsx_edge.kl \
    $(LOCAL_PATH)/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl

#hostapd
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf

#data
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/data/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/data/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/data/qmi_config.xml:system/etc/data/qmi_config.xml 

#wake_gesture
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wakegesture.sh:system/bin/wakegesture.sh

#misc
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/misc,system/etc)


PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml\
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml\
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml

#FEATURE_OPENGLES_EXTENSION_PACK support string config file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

#ANT+ stack
PRODUCT_PACKAGES += \
    com.dsi.ant.antradio_library \
    AntHalService \
    libantradio \
    antradio_app

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.msm8992 \
    tinymix \
    libtinycompress \
    cplay

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle

# Bson
PRODUCT_PACKAGES += \
    libbson

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Connectivity Engine support
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# Curl
PRODUCT_PACKAGES += \
    libcurl \
    curl

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    make_ext4fs \
    setup_fs

# GPS
PRODUCT_PACKAGES += \
    gps.msm8992

# Graphics
PRODUCT_PACKAGES += \
    consumerir.msm8992.so \
    copybit.msm8992 \
    gralloc.msm8992 \
    hwcomposer.msm8992 \
    memtrack.msm8992 \
    liboverlay \
    libtinyxml

# IPv6
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# Camrera
PRODUCT_PACKAGES += \
    Snap

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8992

# Lights
PRODUCT_PACKAGES += \
    lights.msm8992

# Live Wallpapers
PRODUCT_PACKAGES += \
    librs_jni

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdecHevc \
    libOmxVdec \
    libOmxVenc \
    libOmxVidcCommon \
    libstagefrighthw \
    qcmediaplayer

#rmnetctl
PRODUCT_PACKAGES += \
    librmnetctl

# Power
PRODUCT_PACKAGES += \
    power.msm8992

PRODUCT_BOOT_JARS += \
    qcmediaplayer

# Ril
PRODUCT_PACKAGES += \
    libtinyxml2 \
    libxml2

#workaround
PRODUCT_PACKAGES += \
    libboringssl-compat

# Sensors
PRODUCT_PACKAGES += \
    sensors.msm8992

#stlport
PRODUCT_PACKAGES += \
    libstlport \
    libcamera_shim

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    wpa_supplicant.conf \
    wpa_supplicant \
    libwpa_client \
    libwcnss_qmi \
    wcnss_service \
    libQWiFiSoftApCfg \
    libqsap_sdk \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf \
    hostapd \
    hostapd_cli \
    dhcpcd.conf

#wcnss
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wcnss_service:system/bin/wcnss_service

#gps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf

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
    init.qcom.post_boot.sh \
    init.qcom.factory.sh \
    init.qcom.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.usb.sh \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.recovery.hardware.rc \
    init.target.rc \
    ueventd.goldfish.rc \
    ueventd.qcom.rc \
    fstab.qcom

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Xiaomi/libra/libra:5.1.1/LMY47V/6.3.10:user/release-keys \
    PRIVATE_BUILD_DESC="libra-user 5.1.1 LMY47V 6.3.10 release-keys"
