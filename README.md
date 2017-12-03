macOS on Dell XPS 9360
======================

This repository contains a sample configuration to run macOS (Currently High Sierra 10.13.1) on a Dell XPS 9360

### Preparation

This repository has been tested against Dell XP 9360 buis version 2.3.1. For best results ensure this is the bios version of the target machine.

#### UEFI Variables

In order to run macOS successfully a number of EFI BIOS variables need to be modified. The included Clover bootloader contains an updated `Shell64U.efi`, which includes a `setupvar` command to help do just that.

The following variables need to be updated:

| Variable              | Offset | Default value  | Desired value   | Comment                                                    |
|-----------------------|--------|----------------|-----------------|------------------------------------------------------------|
| CFG Lock              | 0x4de  | 0x01 (Enabled) | 0x00 (Disabled) | Disable CFG Lock to prevent MSR 0x02 errors on boot        |
| DVMT Pre-allocation   | 0x785  | 0x01 (32M)     | 0x06 (192M)     | Increase DVMT pre-allocated size to 192M for QHD+ displays |
| DVMT Total Gfx Memory | 0x786  | 0x01 (128M)    | 0x03 (MAX)      | Increase total gfx memory limit to maximum                 |

#### Clover Configuration

All Clover hotpatches are included in DSL format in DSDT. If required the script `--compile-dsdt` option can be used to compile any changes to the DSL files into `./CLOVER/ACPI/patched`.

#### AppleHDA

In order to support the Realtek ALC256 (ALC3246) codec of the Dell XPS 9360, a custom HDA injector is needed.

The script option `--patch-hda` option generates an AppleHDA_ALC256.kext injector and installs it in `/Library/Extensions` for this purpose.


### Credits

  - OS-X-Clover-Laptop-Config (Hot-patching)  
  https://github.com/RehabMan/OS-X-Clover-Laptop-Config
  - Dell XPS 13 9360 Guide by bozma88  
  https://www.tonymacx86.com/threads/guide-dell-xps-13-9360-on-macos-sierra-10-12-x-lts-long-term-support-guide.213141
  - AppleHDA ALC256  
  https://github.com/Mirone/AppleHDAPatcher
  - AppleALC  
  https://github.com/vit9696/AppleALC
