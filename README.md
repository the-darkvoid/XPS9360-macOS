# macOS on Dell XPS 9360

This repository contains a sample configuration to run macOS (Currently High Sierra `10.13.6`) on a Dell XPS 9360

## Used Hardware Configuration

- Dell XPS 9360
  - Intel i7-8550U
  - 16GB RAM
  - Sharp `SHP144` `LQ133Z1` QHD+ (3200x1800) Touchscreen display
  - [Western Digital Black 512GB SSD](http://a.co/8JOsXFG) (WDS512G1X0C-00ENX0) on latest firmware
    - Formatted for APFS with 4K sectors, using [nvme-cli](https://github.com/linux-nvme/nvme-cli) using this [guide](https://www.tonymacx86.com/threads/guide-sierra-on-hp-spectre-x360-native-kaby-lake-support.228302/)
  - Dell DW1560 Wireless (eBay)
    - Wi-Fi device ID [`14e4:43b1`], shows as Apple Airport Extreme due to `FakePCIID_Broadcom_WiFi.kext`
    - Bluetooth device ID [`0a5c:216f`], chipset `20702A3` with firmware `v14 c5882` using `BrcmPatchRAM2.kext`
  - Sonix Technology Webcam, device ID [`0c45:670c`], works out of the box
  - Validity Inc. Finger print scanner, device ID [`138a:0091`], [linux open-source project](https://github.com/hmaarrfk/Validity91)
  - Disabled devices
    - Touchscreen (though it works out of the box if enabled)
    - SD card reader, [macOS open-source project](https://github.com/sinetek/Sinetek-rtsx)

- Firmware Revisions
  - BIOS version `2.8.1`
  - Thunderbolt Controller firmware version `NVM 26`

- External Devices
  - [Caldigit USB-C Dock](http://a.co/8I1agKD)
    - Supports USB-C PD (Power Delivery), Ethernet, 3x USB-3, USB-C, HDMI & DisplayPort connections
  - [Dodocool 7-in-1 USB-C Hub](http://a.co/eGmk4K9)
    - USB-C PD (Power Delivery), Ethernet, 1x USB-3 & HDMI connections
  - [Benfei USB-C Adapter](http://a.co/1Lcm6Ot)
    - USB-C PD (Power Delivery), Ethernet, 1x USB-3 & HDMI connections

- Monitors
  - [HP E273q 27" QHD TFT](http://www8.hp.com/us/en/products/monitors/product-detail.html?oid=18164507)
  - [HP E272 27" QHD TFT](http://www8.hp.com/h20195/v2/GetDocument.aspx?docname=c04819807)
  - [HP E222 21.5" HD TFT](http://www8.hp.com/ca/en/products/monitors/product-detail.html?oid=8402841)

## Preparation

This repository has been tested against Dell XP 9360 bios version `2.8.1` with Thunderbolt firmware `NVM 26.1`. For best results ensure this is the bios version of the target machine.

## UEFI Variables

In order to run macOS successfully a number of EFI BIOS variables need to be modified. The included Clover bootloader contains an updated `DVMT.efi`, which includes a `setup_var` command to help do just that.

`DVMT.efi` can be launched from Clover directly by renaming it to `Shell64U.efi` in the `tools` folder.

The following variables need to be updated:

| Variable              | Offset | Default value  | Desired value   | Comment                                                    |
|-----------------------|--------|----------------|-----------------|------------------------------------------------------------|
| CFG Lock              | 0x4de  | 0x01 (Enabled) | 0x00 (Disabled) | Disable CFG Lock to prevent MSR 0x02 errors on boot        |
| DVMT Pre-allocation   | 0x785  | 0x01 (32M)     | 0x06 (192M)     | Increase DVMT pre-allocated size to 192M for QHD+ displays |
| DVMT Total Gfx Memory | 0x786  | 0x01 (128M)    | 0x03 (MAX)      | Increase total gfx memory limit to maximum                 |

## Clover Configuration

All Clover hotpatches are included in source DSL format in the DSDT folder.
If required the script `--compile-dsdt` option can be used to compile any changes to the DSL files into `./CLOVER/ACPI/patched`.

## AppleHDA

In order to support the Realtek ALC256 (ALC3246) codec of the Dell XPS 9360, AppleALC is included with layout-id `56`.

Alternatively, a custom AppleHDA injector can be used.
The script option `--patch-hda` option generates an AppleHDA_ALC256.kext injector and installs it in `/Library/Extensions` for this purpose, in this case the layout-id is `1`.

## Display Profiles

Display profiles for the Sharp LQ133Z1 display (Dell XPS 9360 QHD+) are included in the displays folder.

Profiles can be installed by copying them into `/Users/<username>/Library/ColorSync/Profiles` folder, additionally the macOS built-in `ColorSync` utility can be used to inspect the profiles.

Profiles are configured on a per display basis in the `System Preferences` -> `Display` preferences menu.

## Credits

- [OS-X-Clover-Laptop-Config (Hot-patching)](https://github.com/RehabMan/OS-X-Clover-Laptop-Config)
- [Dell XPS 13 9360 Guide by bozma88](https://www.tonymacx86.com/threads/guide-dell-xps-13-9360-on-macos-sierra-10-12-x-lts-long-term-support-guide.213141/)
- [VoodooI2C on XPS 13 9630 by Vygr10565](https://www.tonymacx86.com/threads/guide-dell-xps-13-9360-on-macos-sierra-10-12-x-lts-long-term-support-guide.213141/page-202#post-1708487)
- [USB-C Hotplug through ExpressCard by dpassmor](https://www.tonymacx86.com/threads/usb-c-hotplug-questions.211313/)
- Kext authors mentioned in [kexts/kexts.txt](https://github.com/the-darkvoid/XPS9360-macOS/blob/master/kexts/kexts.txt)
