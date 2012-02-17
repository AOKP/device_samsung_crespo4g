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
# build for crespo hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Camera
PRODUCT_PACKAGES := \
    Camera

# Live Wallpapers
PRODUCT_PACKAGES += \
        Galaxy4 \
        HoloSpiralWallpaper \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        NoiseField \
        PhaseBeam \
        VisualizationWallpapers \
        librs_jni

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, device/samsung/crespo4g/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/products/common_phone.mk)

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/crespo4g

# Setup device specific product configuration.
PRODUCT_NAME := aokp_crespo4g
PRODUCT_BRAND := google
PRODUCT_DEVICE := crespo4g
PRODUCT_MODEL := Nexus S 4G
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=sojus BUILD_ID=GWK74 BUILD_FINGERPRINT=google/sojus/crespo4g:2.3.7/GWK74/185293:user/release-keys PRIVATE_BUILD_DESC="sojus-user 2.3.7 GWK74 185293 release-keys" BUILD_NUMBER=185293

# Inherit common build.prop overrides
-include vendor/aokp/products/common_versions.mk

# Copy crespo4g specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/crespo/app/Thinkfree.apk:system/app/Thinkfree.apk \
    vendor/aokp/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip


# Inherit Face lock security blobs
#-include vendor/aokp/products/common_facelock.mk

# Inherit drm blobs
#-include vendor/aokp/products/common_drm.mk
