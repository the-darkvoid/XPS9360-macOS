DefinitionBlock ("", "SSDT", 2, "hack", "NVMe-PM", 0x00000000)
{
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)    // (from opcode)

    Method (_SB.PCI0.RP09.PXSX._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (!Arg2) { Return (Buffer() { 0x03 }) }

        Return (Package()
        {
            "deep-idle", One
        })
    }
}

