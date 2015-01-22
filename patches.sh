#!/bin/bash

if [ -f ~/bin/paths-12.0.sh ]; then
    source ~/bin/paths-12.0.sh
fi

if [ ! -d ".repo" ]; then
    echo -e "No .repo directory found.  Is this an Android build tree?"
    exit 1
fi

if [ "${android}" = "" ]; then
    android="${PWD}"
fi

# frameworks/av : Add back missing msm7x27a to fix compilation
cherries+=(79582)

# Build : Add back support for msm7x27a Board
#cherries+=(79581)

# build: Add option to disable block-based ota
cherries+=(78849)

# mtdutils: Fix mounting partitions by-name
(cherries+=(83404/1)

# install: disable signature checking on eng and userdebug builds
cherries+=(81797)

# lowmemorykiller: Overwrite LMK parameters for low-tier devices
cherries+=(86327)

${android}/build/tools/repopick.py -b ${cherries[@]}
