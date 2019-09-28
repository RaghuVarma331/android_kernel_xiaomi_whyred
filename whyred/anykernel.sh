# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=KernelTest
do.devicecheck=
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=whyred
'; } # end properties

# shell variables
block=auto;
is_slot_device=1;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel install
dump_boot;
write_boot;

## end install

