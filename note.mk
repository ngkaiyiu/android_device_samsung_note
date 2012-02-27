# Copyright (C) 2010 The Android Open Source Project
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


# This file is the device-specific product definition file for
# crespo. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that crespo is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Camera
PRODUCT_PACKAGES += \
	Camera

# Init files
PRODUCT_COPY_FILES := \
	device/samsung/note/lpm.rc:root/lpm.rc \
	device/samsung/note/lpm.rc:recovery/root/lpm.rc \
	device/samsung/note/recovery.rc:recovery/root/recovery.rc \
	device/samsung/note/init.smdk4210.rc:root/init.smdk4210.rc \
	device/samsung/note/init.smdk4210.usb.rc:root/init.smdk4210.usb.rc \

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Wifi
PRODUCT_COPY_FILES += \
	device/samsung/note/configs/nvram_net.txt:system/etc/nvram_net.txt \
	device/samsung/note/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# Gps
PRODUCT_COPY_FILES += \
	device/samsung/note/configs/gps.conf:system/etc/gps.conf \
	device/samsung/note/configs/sirfgps.conf:system/etc/sirfgps.conf

# Vold
PRODUCT_COPY_FILES += \
	device/samsung/note/configs/vold.fstab:system/etc/vold.fstab \

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/note/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/samsung/note/keylayout/Broadcom_Bluetooth_HID.kl:system/usr/keylayout/Broadcom_Bluetooth_HID.kl \
	device/samsung/note/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/samsung/note/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/note/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
	device/samsung/note/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
        device/samsung/note/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
        device/samsung/note/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
        device/samsung/note/keylayout/max8997-muic.kl:system/usr/keylayout/max8997-muic.kl \
        device/samsung/note/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
        device/samsung/note/keylayout/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
        device/samsung/note/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
        device/samsung/note/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
        device/samsung/note/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
        device/samsung/note/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
        device/samsung/note/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
        device/samsung/note/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
        device/samsung/note/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
        device/samsung/note/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
        device/samsung/note/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
        device/samsung/note/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl 

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072 \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true

PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=eth0 \
       wifi.supplicant_scan_interval=20 \
       ro.telephony.ril_class=samsung \
       ro.telephony.ril.v3=1 \
       ro.telephony.sends_barcount=1 \
       mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
       dalvik.vm.heapsize=128m \
       persist.service.usb.setting=0 \
       dev.sfbootcomplete=0 \
       persist.sys.vold.switchexternal=1

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# Keylayout
PRODUCT_COPY_FILES += \
	device/samsung/note/keylayout/AVRCP.kl:/system/usr/keylayout/AVRCP.kl \
	device/samsung/note/keylayout/Broadcom_Bluetooth_HID.kl:/system/usr/keylayout/Broadcom_Bluetooth_HID.kl \
	device/samsung/note/keylayout/sec_jack.kl:/system/usr/keylayout/sec_jack.kl \
	device/samsung/note/keylayout/sec_key.kl:/system/usr/keylayout/sec_key.kl \
	device/samsung/note/keylayout/sec_touchkey.kl:/system/usr/keylayout/sec_touchkey.kl

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# kernel modules for ramdisk
RAMDISK_MODULES = $(addprefix device/samsung/note/modules/,dhd.ko j4fs.ko \
	scsi_wait_scan.ko)
PRODUCT_COPY_FILES += $(foreach module,\
	$(RAMDISK_MODULES),\
	$(module):root/lib/modules/$(notdir $(module)))

# Audio
# soundbooster.txt - needs to be at /data/soundbooster.txt
PRODUCT_COPY_FILES += \
  device/samsung/note/configs/soundbooster.txt:system/etc/audio/soundbooster.txt

# Filesystem management tools
PRODUCT_PACKAGES += \
	static_busybox \
	make_ext4fs \
	setup_fs

# other kernel modules not in ramdisk
PRODUCT_COPY_FILES += $(foreach module,\
	$(filter-out $(RAMDISK_MODULES),$(wildcard device/samsung/note/*.ko)),\
	$(module):system/lib/modules/$(notdir $(module)))

# kernel modules for recovery ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/note/j4fs.ko:recovery/root/lib/modules/j4fs.ko

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/note/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel



# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/samsung/note/note-vendor.mk)
