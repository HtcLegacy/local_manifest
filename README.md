PicoLegacy
==============

The local manifests for building CM12 for HTC Explorer/Pico.

To sync:
-------

    repo init -u git://github.com/CyanogenMod/android.git -b cm-12.1
    curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.githubusercontent.com/HtcLegacy/local_manifest/cm-12.1/local_manifest.xml
    repo sync
    
Picking cherries from Cyanogenmod :
----------------
   
   repopick 92978
  

To Build :
--------

    sh vendor/cm/get-prebuilts
    source build/envsetup.sh
    brunch cm_pico-userdebug 
