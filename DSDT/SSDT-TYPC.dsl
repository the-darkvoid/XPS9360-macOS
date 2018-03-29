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

// XHC.SS01 - USB 3 right side
// XHC.SS02 - USB 3 left side
// XHC.HS02 - USB 2 left side
// XHC.HS01.HUB - USB 2 right side


DefinitionBlock ("", "SSDT", 2, "hack", "TYPC", 0x00000000)
{
	External (_SB.PCI0.RP01, DeviceObj)    // (from opcode)
	External (_SB.PCI0.RP01.PXSX, DeviceObj)    // (from opcode)

	External(_SB.TBFP, MethodObj)

	Scope (_SB.PCI0.RP01)
	{
		Method (_PS0, 0, Serialized)  // _PS0: Power State 0
		{
			\_SB.TBFP(One)
		}

		Method (_PS3, 0, Serialized)  // _PS3: Power State 3
		{
			\_SB.TBFP(Zero)
		}
	}

	// USB-C
	Scope (_SB.PCI0.RP01.PXSX) // UPSB
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

		Device (DSB2)
		{
			Name (_ADR, 0x00020000)  // _ADR: Address

			Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
			{
				If (Arg2 == Zero) { Return (Buffer() { 0x03 } ) }

				Return (Package()
				{
					"PCIHotplugCapable", Zero
				})
			}
			
			Device (XHC2)
			{
				Name (_ADR, Zero)  // _ADR: Address

				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					If (Arg2 == Zero) { Return (Buffer() { 0x03 } ) }

					Return (Package()
					{
						"USBBusNumber", Zero,
						"AAPL,xhci-clock-id", One, 
						"UsbCompanionControllerPresent", Zero,
						//"device-id", Buffer() { 0xb6, 0x15, 0x00, 0x00 },
					})
				}
/*
				Name (HS, Package ()
				{
					"XHC"
				})
				Name (FS, Package ()
				{
					"XHC"
				})
				Name (LS, Package ()
				{
					"XHC"
				})
*/
				Device (RHUB)
				{
					Name (_ADR, Zero)  // _ADR: Address

					Device (SSP1)
					{
						Name (_ADR, One)  // _ADR: Address

						Name (_UPC, Package ()  // _UPC: USB Port Capabilities
						{
							0xFF, 0x09, Zero, Zero
						})

						Name (_PLD, Package ()  // _PLD: Physical Location of Device
						{
							Buffer ()
							{
								/* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
								/* 0008 */  0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
							}
						})
/*
						Name (HS, Package ()
						{
							"XHC",
							0x02
						})

						Name (FS, Package ()
						{
							"XHC",
							0x02
						})

						Name (LS, Package ()
						{
							"XHC",
							0x02
						})
*/
						Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
						{
							If (Arg2 == Zero) { Return (Buffer() { 0x03 } ) }

							Return (Package()
							{
								"UsbCPortNumber", 0x02, 
								"UsbCompanionPortPresent", Zero
							})
						}
					}

					Device (SSP2)
					{
						Name (_ADR, 0x03)  // _ADR: Address

						Name (_UPC, Package ()  // _UPC: USB Port Capabilities
						{
							0xFF, 0x09, Zero, Zero
						})

						Name (_PLD, Package ()  // _PLD: Physical Location of Device
						{
							Buffer ()
							{
								/* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
								/* 0008 */  0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
							}
						})
/*
						Name (HS, Package ()
						{
							"XHC",
							0x0e
						})

						Name (FS, Package ()
						{
							"XHC",
							0x0e
						})

						Name (LS, Package ()
						{
							"XHC",
							0x0e
						})
*/
						Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
						{
							If (Arg2 == Zero) { Return (Buffer() { 0x03 } ) }

							Return (Package()
							{
								"UsbCPortNumber", One, 
								"UsbCompanionPortPresent", Zero
							})
						}
					}
				}
			}
		}
	}

/*
	// Thunderbolt
	Scope (_SB.PCI0.RP01.PXSX) // UPSB
	{

		Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
		{
			\RMDT.PUSH("_SB.PCI0.RP01.PXSX: Entering _DSM")

			If (Arg2 == Zero) { Return (Buffer() { 0x03 } ) }

			Return (Package()
			{
				"PCI-Thunderbolt", One,
			})
		}

		Device (DSB0)
		{
			Name (_ADR, Zero)  // _ADR: Address

			Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
			{
				\RMDT.PUSH("_SB.PCI0.RP01.PXSX.DSB0: Entering _DSM")

				If (Arg2 == Zero) { Return (Buffer() { 0x03 } ) }

				Return (Package()
				{
					"PCIHotplugCapable", Zero,
				})
			}

			Device (NHI0)
			{
				Name (_ADR, Zero) // _ADR: Address
				Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String

				Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
				{
					\RMDT.PUSH("_SB.PCI0.RP01.PXSX.DSB0.NHI0: Entering _DSM")

					If (Arg2 == Zero) { Return (Buffer() { 0x03 } ) }

					Return (Package()
					{
						//"TBTDPLowToHigh", Buffer() { 0x01, 0x00, 0x00, 0x00 },
						//"TBTFlags", Buffer() { 0x03, 0x00, 0x00, 0x00 },
						//"ThunderboltConfig", Buffer() { 0x00, 0x02, 0xff, 0xff, 0x04, 0x00, 0x04, 0x02, 0x01, 0x00, 0x10, 0x00, 0x04, 0x02, 0x02, 0x00, 0x05, 0x00, 0x04, 0x02, 0x01, 0x00, 0x12, 0x00, 0x04, 0x02, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00 },
						//"ThunderboltDROM", Buffer() { 0xe1, 0x00, 0x84, 0x72, 0x3c, 0xc3, 0x4a, 0x01, 0x00, 0x0a, 0x9b, 0x60, 0xfa, 0x01, 0x5e, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0x08, 0x81, 0x80, 0x02, 0x80, 0x00, 0x00, 0x00, 0x08, 0x82, 0x90, 0x01, 0x80, 0x00, 0x00, 0x00, 0x08, 0x83, 0x80, 0x04, 0x80, 0x01, 0x00, 0x00, 0x08, 0x84, 0x90, 0x03, 0x80, 0x01, 0x00, 0x00, 0x08, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x86, 0x20, 0x03, 0x87, 0x80, 0x02, 0xc8, 0x05, 0x89, 0x50, 0x00, 0x00, 0x05, 0x8a, 0x50, 0x00, 0x00, 0x02, 0xcb, 0x0d, 0x01, 0x41, 0x70, 0x70, 0x6c, 0x65, 0x20, 0x49, 0x6e, 0x63, 0x2e, 0x00, 0x0c, 0x02, 0x4d, 0x61, 0x63, 0x69, 0x6e, 0x74, 0x6f, 0x73, 0x68, 0x00 },
						//"ThunderboltUUID", Buffer() { 0x6d, 0x84, 0xff, 0x0d, 0xa6, 0xcd, 0x62, 0x5d, 0x95, 0xab, 0x45, 0x60, 0x4f, 0xf5, 0xeb, 0xdf },
						"power-save", One,
						Buffer() { 0x00 }
					})
				}
			}
		}

		Device (DSB1)
		{
			Name (_ADR, 0x00010000)  // _ADR: Address
		}
	}
*/
}
