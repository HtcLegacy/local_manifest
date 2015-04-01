#!/bin/bash

if [ -f ~/bin/paths-12.1.sh ]; then
    source ~/bin/paths-12.1.sh
fi

if [ ! -d ".repo" ]; then
    echo -e "No .repo directory found.  Is this an Android build tree?"
    exit 1
fi

if [ "${android}" = "" ]; then
    android="${PWD}"
fi

# audio: Make getPresentationPosition pure virtual
cherries+=(92978)

# audio: Initialized mAttributes in AudioTrack
cherries+=(92977)


if [ -z $cherries ]; then
    echo -e "Nothing to cherry-pick!"
else
    ${android}/build/tools/repopick.py -b ${cherries[@]}
fi
