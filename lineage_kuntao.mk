
# Copyright (C) 2016 The CyanogenMod Project
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

# Inherit device configuration
$(call inherit-product, device/lenovo/kuntao/full_kuntao.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 1920

# Google
PRODUCT_GMS_CLIENTID_BASE := android-lenovo

# Override build properties.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="kuntao_row-user 7.0 NRD90N P2a42_S251_171107_ROW release-keys" \
    TARGET_DEVICE="P2a42"

BUILD_FINGERPRINT := Lenovo/kuntao_row/P2a42:7.0/NRD90N/P2a42_S251_171107_ROW:user/release-keys

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kuntao
PRODUCT_NAME := lineage_kuntao
PRODUCT_BRAND := Lenovo
PRODUCT_MANUFACTURER := Lenovo
PRODUCT_RELEASE_NAME := kuntao
