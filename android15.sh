#!/bin/bash

# Exit script on error
# set -e

repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs
# /opt/crave/resync.sh
rm -rf hardware/qcom-caf/sm8150/media
rm -rf packages/apps/Updater
rm -rf vendor/lineage
git clone https://github.com/yaap/hardware_qcom-caf_sm8150_media.git --depth 1 -b fifteen hardware/qcom-caf/sm8150/media
git clone https://github.com/dpenra/android_packages_apps_Updater.git --depth 1 -b fifteen packages/apps/Updater
git clone https://github.com/dpenra/android_vendor_lineage.git --depth 1 -b fifteen vendor/lineage
. build/envsetup.sh
riseup sunny user
rise b
