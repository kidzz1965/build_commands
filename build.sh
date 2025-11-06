#! /bin/bash

rm -rf .repo/local_manifests; \
repo init -u https://github.com/LumineDroid/platform_manifest.git -b bynx --git-lfs; \
rm -rf prebuilts/clang/host/linux-x86; \
/opt/crave/resync.sh; \

mf=(
device/xiaomi/chime
kernel/xiaomi/chime
vendor/xiaomi/chime
hardware/xiaomi
upload.sh
upload.sh1
)

rm -rf "${mf[@]}"

git clone https://github.com/kidzz1965/device_xiaomi_chime.git -b lineage-23.0 device/xiaomi/chime

source build/envsetup.sh
export LUMINE_MAINTAINER="Kidzz"
lunch lineage_chime-bp2a-userdebug
mka bacon

wget https://raw.githubusercontent.com/Sushrut1101/GoFile-Upload/refs/heads/master/upload.sh
chmod +x upload.sh
./upload.sh out/target/product/chime/LumineDroid*chime*.zip
