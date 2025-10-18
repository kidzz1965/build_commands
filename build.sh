#! /bin/bash

rm -rf .repo/local_manifests; \
repo init -u https://github.com/DerpFest-AOSP/android_manifest.git -b 16 --git-lfs; \
rm -rf prebuilts/clang/host/linux-x86; \
/opt/crave/resync.sh; \

mf=(
device/xiaomi/chime
kernel/xiaomi/chime
vendor/xiaomi/chime
hardware/xiaomi
)

rm -rf "${mf[@]}"

git clone https://github.com/kidzz1965/device_xiaomi_chime.git -b lineage-23.0 device/xiaomi/chime


source build/envsetup.sh
brunch chime
