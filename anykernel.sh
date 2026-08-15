## ZSU GKI AnyKernel3 installer
## Kernel-only package: replace the active boot Image without device-specific
## ramdisk or fstab modifications.

### AnyKernel setup
properties() { '
kernel.string=ZSU GKI Kernel
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; }

### boot shell variables
# GKI kernel-only boot images, including Android header v4 images with
# RAMDISK_SZ=0, must be split and flashed without unpacking/repacking a ramdisk.
# AnyKernel resolves the device-specific by-name path and active A/B slot.
BLOCK=boot;
IS_SLOT_DEVICE=auto;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching (do not remove)
. tools/ak3-core.sh;

### boot install
split_boot;
flash_boot;
## end boot install

### end AnyKernel
