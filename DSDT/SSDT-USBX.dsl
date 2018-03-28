DefinitionBlock ("", "SSDT", 2, "hack", "EC-USBX", 0x00000000)
{
	Device (_SB.USBX)
	{
		Name (_ADR, Zero)  // _ADR: Address
		Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
		{
			If (!Arg2)
			{
				Return (Buffer ()
				{
					0x03
				})
			}

			Return (Package ()
			{
				"kUSBSleepPortCurrentLimit", 
				3000, 
				"kUSBSleepPowerSupply", 
				2600, 
				"kUSBWakePortCurrentLimit", 
				3000, 
				"kUSBWakePowerSupply", 
				3200
			})
		}
	}
}

