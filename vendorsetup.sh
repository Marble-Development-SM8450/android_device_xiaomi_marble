#!/bin/bash

echo "Starting cloning process…"

echo "Cloning Device Common Tree"
git clone https://github.com/Marble-Development-SM8450/android_device_xiaomi_sm8450-common device/xiaomi/sm8450-common

echo "Cloning MemeCamera Tree"
git clone https://github.com/aosp-pablo/device_xiaomi_miuicamera-marble device/xiaomi/miuicamera-marble
git clone https://github.com/aosp-pablo/vendor_xiaomi_miuicamera-marble vendor/xiaomi/miuicamera-marble

echo "Cloning Hardware Xiaomi Tree"
git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-23.2 hardware/xiaomi

echo "Cloning Hardware Dolby Tree"
git clone https://github.com/Chaitanyakm/hardware_dolby hardware/dolby

echo "Cloning Kernel Tree"
git clone --depth=1 https://github.com/LineageOS/android_kernel_xiaomi_sm8450 kernel/xiaomi/sm8450
git clone --depth=1 https://github.com/LineageOS/android_kernel_xiaomi_sm8450-modules kernel/xiaomi/sm8450-modules
git clone --depth=1 https://github.com/LineageOS/android_kernel_xiaomi_sm8450-devicetrees kernel/xiaomi/sm8450-devicetrees

echo "Cloning Vendor Tree"
git clone https://github.com/Marble-Development-SM8450/proprietary_vendor_xiaomi_marble vendor/xiaomi/marble --depth=2

echo "Cloning Vendor Common Tree"
git clone https://github.com/Marble-Development-SM8450/proprietary_vendor_xiaomi_sm8450-common vendor/xiaomi/sm8450-common --depth=2

echo "cloning gamebar"
git clone https://github.com/kenway214/packages_apps_GameBar packages/apps/GameBar

if bash device/xiaomi/miuicamera-marble/vendorsetup.sh; then
    echo "MemeCam parts patched"
else
    echo "MemeCam parts not patched"
fi
export NINJA_ARGS="-w dupbuild=warn"
export SKIP_ABI_CHECKS=true

echo "All repositories cloned successfully "
