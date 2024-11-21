#!/bin/bash

# Exit script on error
set -e

echo "### Cleaning up existing directories..."
# Remove existing directories to avoid conflicts
rm -rf device/xiaomi/sunny \
       device/qcom/common \
       device/qcom/qssi \
       device/xiaomi/sunny-kernel \
       vendor/xiaomi/sunny \
       vendor/qcom/common \
       vendor/qcom/opensource/core-utils \
       packages/apps/DisplayFeatures \
       packages/apps/KProfiles \
       hardware/xiaomi \
       hardware/qcom-caf/sm8150/media \
       prebuilts/gcc/linux-x86/aarch64/aarch64-elf \
       prebuilts/gcc/linux-x86/arm/arm-eabi \
       packages/apps/ViPER4AndroidFX \
       vendor/bcr \
       vendor/xiaomi/mojito-leicacamera \
       vendor/xiaomi/miuiapps \
       vendor/xiaomi/dynamicSpot \
       packages/apps/Updater \
       vendor/lineage \
       vendor/lineage-priv/keys


echo "### Cloning device-specific repositories..."
# Clone device-specific repositories
git clone https://github.com/dpenra/device_xiaomi_sunny.git --depth 1 -b lineage-22 device/xiaomi/sunny
git clone https://github.com/yaap/device_qcom_common.git --depth 1 -b fifteen device/qcom/common
git clone https://github.com/AOSPA/android_device_qcom_qssi.git --depth 1 -b vauxite device/qcom/qssi
git clone https://github.com/dpenra-sunny/device_xiaomi_sunny-kernel.git --depth 1 -b fourteen device/xiaomi/sunny-kernel

echo "### Cloning vendor repositories..."
# Clone vendor repositories
git clone https://github.com/yaap/vendor_xiaomi_sunny.git --depth 1 -b fifteen vendor/xiaomi/sunny
rm vendor/xiaomi/sunny/proprietary/vendor/lib64/android.hardware.camera.provider@2.4-legacy.so
wget -P ./vendor/xiaomi/sunny/proprietary/vendor/lib64/ "https://gitlab.com/pnplusplus/android_vendor_xiaomi_mojito-leicacamera/-/raw/main/proprietary/vendor/lib64/android.hardware.camera.provider@2.4-legacy.so"
git clone https://gitlab.com/yaosp/vendor_qcom_common.git --depth 1 -b fifteen vendor/qcom/common
git clone https://github.com/yaap/vendor_qcom_opensource_core-utils.git --depth 1 -b fifteen vendor/qcom/opensource/core-utils

echo "### Cloning package repositories..."
# Clone package repositories
git clone https://github.com/cyberknight777/android_packages_apps_DisplayFeatures packages/apps/DisplayFeatures
git clone https://github.com/KProfiles/android_packages_apps_Kprofiles.git --depth 1 -b main packages/apps/KProfiles

echo "### Cloning hardware repositories..."
# Clone hardware repositories
git clone https://github.com/yaap/hardware_xiaomi.git --depth 1 -b fifteen hardware/xiaomi
git clone https://github.com/yaap/hardware_qcom-caf_sm8150_media.git --depth 1 -b fifteen hardware/qcom-caf/sm8150/media

echo "### Cloning prebuilt GCC toolchains..."
# Clone prebuilt GCC toolchains
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-elf.git --depth 1 -b 14.0.0 prebuilts/gcc/linux-x86/aarch64/aarch64-elf
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_arm_arm-eabi.git --depth 1 -b 12.0.0 prebuilts/gcc/linux-x86/arm/arm-eabi

echo "### Adding custom repositories..."
# Add custom repositories for additional features
git clone https://github.com/xiaomi-begonia-dev/android_packages_apps_ViPER4AndroidFX.git --depth 1 -b fourteen packages/apps/ViPER4AndroidFX
git clone https://github.com/Chaitanyakm/vendor_bcr.git --depth 1 -b main vendor/bcr
git clone https://gitlab.com/dpenra/android_vendor_xiaomi_mojito-leicacamera.git --depth 1 -b main vendor/xiaomi/mojito-leicacamera
git clone https://github.com/dpenra-app/android_vendor_xiaomi_miuiapps.git --depth 1 -b main vendor/xiaomi/miuiapps
git clone https://github.com/dpenra-app/vendor_xiaomi_dynamicSpot.git --depth 1 -b main vendor/xiaomi/dynamicSpot
git clone https://github.com/dpenra/android_packages_apps_Updater.git --depth 1 -b fifteen packages/apps/Updater

echo "### Cloning source modifications..."
# Source modifications and RisingOS-specific keys
git clone https://github.com/dpenra/android_vendor_lineage.git --depth 1 -b fifteen vendor/lineage
git clone https://github.com/rom-key/lineage-priv-risingos.git --depth 1 -b main vendor/lineage-priv/keys

echo "### Script completed successfully!"
