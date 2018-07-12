// Allow VoodooI2C.kext and VoodooI2CHID.kext to drive the touchpad
// Credit Vygr10565 (https://www.tonymacx86.com/threads/guide-dell-xps-13-9360-on-macos-sierra-10-12-x-lts-long-term-support-guide.213141/page-202#post-1708487)

DefinitionBlock ("", "SSDT", 2, "hack", "I2C", 0)
{
    External (_SB.PCI0.GPI0, DeviceObj)
    Scope (_SB.PCI0.GPI0)
    {
        Method (_STA, 0)
        {
            Return (0x0F)
        }
    }
    
    External (_SB.PCI0.I2C1.TPD1, DeviceObj)
    Scope (_SB.PCI0.I2C1.TPD1)
    {
        External(SBFB, FieldUnitObj)
        External(SBFG, FieldUnitObj)
        
        Method (_CRS, 0, NotSerialized)
        {
            Return (ConcatenateResTemplate (SBFB, SBFG))
        }
    }

    // Disable any VoodooPS2Trackpad and VoodooPS2Mouse devices from loading
    Name(_SB.PCI0.LPCB.PS2K.RMCF, Package()
    {
        "Mouse", Package()
        {
            "DisableDevice", ">y",
        },
        "Synaptics TouchPad", Package()
        {
            "DisableDevice", ">y",
        },
        "ALPS GlidePoint", Package()
        {
            "DisableDevice", ">y",
        },
        "Sentelic FSP", Package()
        {
            "DisableDevice", ">y",
        },
    })
}