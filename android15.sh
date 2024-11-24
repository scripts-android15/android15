#!/bin/bash

repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs
/opt/crave/resync.sh
chmod +x android.sh
./android.sh
. build/envsetup.sh
riseup sunny user
rise b
