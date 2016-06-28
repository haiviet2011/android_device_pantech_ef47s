# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := ef47s

TARGET_BOOTANIMATION_NAME := vertical-720x1280

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/pantech/ef47s/ef47s.mk)

# Device naming
PRODUCT_DEVICE := ef47s
PRODUCT_NAME := cm_ef47s
PRODUCT_BRAND := SKY
PRODUCT_MODEL := Vega Racer 2
PRODUCT_MANUFACTURER := PANTECH
PRODUCT_DEFAULT_LANGUAGE := ko
PRODUCT_DEFAULT_REGION := KR

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SKY_IM-A830S BUILD_FINGERPRINT=SKY/SKY_IM-A830S/ef47s:4.1.2/JZO54K/S0214215.EF47S_013:user/release-keys PRIVATE_BUILD_DESC="msm8960-user 4.1.2 JZO54K S0214215.EF47S_013 release-keys" BUILD_NUMBER=S0214215.EF47S_013
