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

# libstagefright: Make it possible to skip OMX buffer reallocation
cherries+=(79137)

# libstagefright: Make it possible to skip OMX buffer reallocation (2)
cherries+=(84730)

if [ -z $cherries ]; then
    echo -e "Nothing to cherry-pick!"
else
    ${android}/build/tools/repopick.py -b ${cherries[@]}
fi
