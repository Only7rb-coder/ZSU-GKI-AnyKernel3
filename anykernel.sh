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

### boot files attributes
boot_attributes() {
  set_perm_recursive 0 0 755 644 "$RAMDISK"/*;
  set_perm_recursive 0 0 750 750 "$RAMDISK"/init* "$RAMDISK"/sbin;
}

### boot shell variables
# GKI kernels are carried by the boot partition. AnyKernel resolves the
# device-specific by-name path and active A/B slot at install time.
BLOCK=boot;
IS_SLOT_DEVICE=auto;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching (do not remove)
. tools/ak3-core.sh;

### boot install
dump_boot;
write_boot;
## end boot install

### end AnyKernel
