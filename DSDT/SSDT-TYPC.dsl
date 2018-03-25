//
// SSDT-YTBT.dsl
//
// Dell XPS 15 9560
//
// This SSDT fixes Type-C hot plug, and attempts to implement Thunderbolt device tree structure.
//
// Credit to dpassmor for the original ExpressCard idea:
// https://www.tonymacx86.com/threads/usb-c-hotplug-questions.211313/
//

DefinitionBlock ("", "SSDT", 2, "hack", "TYPC", 0x00000000)
{
	External (RMDT, DeviceObj)
	External (RMDT.PUSH, MethodObj)
	External (RMDT.P1, MethodObj)
	External (RMDT.P2, MethodObj)
	External (RMDT.P3, MethodObj)
	External (RMDT.P4, MethodObj)
	External (RMDT.P5, MethodObj)
	External (RMDT.P6, MethodObj)
	External (RMDT.P7, MethodObj)

	External (_SB.PCI0.RP01, DeviceObj)    // (from opcode)
	External (_SB.PCI0.RP01.PXSX, DeviceObj)    // (from opcode)

	External(_SB.TBFP, MethodObj)

	Scope (_SB.PCI0.RP01)
	{
		Method (_PS0, 0, Serialized)  // _PS0: Power State 0
		{
			\RMDT.PUSH("RP01.PXSX._PS0: Powering TBFP")
			\_SB.TBFP(One)
		}

		Method (_PS3, 0, Serialized)  // _PS3: Power State 3
		{
			\RMDT.PUSH("RP01.PXSX._PS3: De-powering TBFP")
			\_SB.TBFP(Zero)
		}
	}

	Scope (_SB.PCI0.RP01.PXSX) //UPSB
	{
		// This is the key fix for machines that turn off the Type-C port, right here.
		Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
		{
			Return (One) // Returning 0 means not a removable device. But we want to act like an ExpressCard! (credit dpassmor)
		}

		Method (_STA, 0, NotSerialized)  // _STA: Status
		{
			Return (0x0F)
		}
	}
}
