//
// SSDT-USBC.dsl
//
// Dell XPS 13 9360
//
// USB-C XHC definitions
//

DefinitionBlock("", "SSDT", 2, "hack", "USBC", 0)
{
    External (_SB_.PCI0.RP01.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.HS01, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.HS02, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.HS03, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.HS04, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.HS05, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.HS06, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.HS07, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.HS08, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.HS09, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.HS10, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.SS01, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.SS02, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.SS03, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.SS04, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.SS05, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.SS06, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.USR1, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC_.RHUB.USR2, DeviceObj)    // (from opcode)
    External (GPRW, MethodObj)    // 2 Arguments (from opcode)
    External (HUBP, UnknownObj)    // (from opcode)
    External (IVAD, IntObj)    // (from opcode)
    External (IVPR, IntObj)    // (from opcode)
    External (IVRS, IntObj)    // (from opcode)
    External (IVWS, IntObj)    // (from opcode)
    External (TBTS, UnknownObj)    // (from opcode)

    External (_SB_.PCI0.RP01.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)    // (from opcode)

    Scope (\_SB.PCI0.XHC.RHUB)
    {
        Method (GPLD, 2, Serialized)
        {
            Name (PCKG, Package (0x01)
            {
                Buffer (0x10){}
            })
            CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
            REV = One
            CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
            VISI = Arg0
            CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
            GPOS = Arg1
            Return (PCKG)
        }

        Method (TPLD, 2, Serialized)
        {
            Name (PCKG, Package (0x01)
            {
                Buffer (0x10){}
            })
            CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
            REV = One
            CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
            VISI = Arg0
            CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
            GPOS = Arg1
            CreateField (DerefOf (PCKG [Zero]), 0x4A, 0x04, SHAP)
            SHAP = One
            CreateField (DerefOf (PCKG [Zero]), 0x20, 0x10, WID)
            WID = 0x08
            CreateField (DerefOf (PCKG [Zero]), 0x30, 0x10, HGT)
            HGT = 0x03
            Return (PCKG)
        }

        Method (GUPC, 1, Serialized)
        {
            Name (PCKG, Package (0x04)
            {
                Zero, 
                0xFF, 
                Zero, 
                Zero
            })
            PCKG [Zero] = Arg0
            Return (PCKG)
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS01)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (One))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            If ((HUBP == One))
            {
                Return (GPLD (Zero, One))
            }

            Return (GPLD (One, One))
        }

        Device (HSP1)
        {
            Name (_ADR, One)  // _ADR: Address
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Return (GUPC (One))
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Return (GPLD (One, One))
            }
        }

        Device (HSP2)
        {
            Name (_ADR, 0x02)  // _ADR: Address
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Return (GUPC (One))
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Return (GPLD (Zero, 0x02))
            }
        }

        Device (HSP3)
        {
            Name (_ADR, 0x03)  // _ADR: Address
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Return (GUPC (One))
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Return (GPLD (Zero, 0x03))
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS02)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (One))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (One, 0x02))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS03)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (One))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, 0x03))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS04)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (One))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, 0x04))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS05)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (One))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, 0x05))
        }

        Device (WCAM)
        {
            Name (_ADR, 0x05)  // _ADR: Address
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                Name (UPCP, Package (0x04)
                {
                    0xFF, 
                    0xFF, 
                    Zero, 
                    Zero
                })
                Return (UPCP)
            }

            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
            {
                Name (PLDP, Package (0x01)
                {
                    Buffer (0x14)
                    {
                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                        /* 0008 */  0x24, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,
                        /* 0010 */  0xC8, 0x00, 0xA0, 0x00                         
                    }
                })
                Return (PLDP)
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS06)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS07)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS08)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS09)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS10)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.USR1)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.USR2)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.SS01)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (One))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            If ((HUBP == One))
            {
                Return (GPLD (Zero, One))
            }

            Return (GPLD (One, One))
        }

        Device (SSP1)
        {
            Name (_ADR, One)  // _ADR: Address
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Return (GUPC (One))
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Return (GPLD (One, One))
            }
        }

        Device (SSP2)
        {
            Name (_ADR, 0x02)  // _ADR: Address
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Return (GUPC (Zero))
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Return (GPLD (Zero, Zero))
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.SS02)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (One))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (One, 0x02))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.SS03)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.SS04)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.SS05)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.SS06)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Return (GUPC (Zero))
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Return (GPLD (Zero, Zero))
        }

        Method (IV01, 1, Serialized)
        {
            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0xFF, 
                Zero, 
                Zero
            })
            Return (UPCP)
        }

        Method (IV02, 1, Serialized)
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */  0x24, 0x81, 0x80, 0x03, 0x00, 0x00, 0x00, 0x00,
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                         
                }
            })
            CreateField (DerefOf (PLDP [Zero]), 0x73, 0x04, ROTA)
            CreateField (DerefOf (PLDP [Zero]), 0x80, 0x10, VOFF)
            CreateField (DerefOf (PLDP [Zero]), 0x90, 0x10, HOFF)
            ROTA = \IVRS
            If ((Arg0 == Zero))
            {
                Switch (ToInteger (\IVRS))
                {
                    Case (Zero)
                    {
                        VOFF = 0xC2
                        HOFF = 0x9E
                    }
                    Case (0x02)
                    {
                        VOFF = 0x9E
                        HOFF = 0xC2
                    }
                    Case (0x04)
                    {
                        VOFF = 0xC2
                        HOFF = 0x9E
                    }
                    Case (0x06)
                    {
                        VOFF = 0x9E
                        HOFF = 0xC2
                    }

                }
            }
            ElseIf ((Arg0 == One))
            {
                Switch (ToInteger (\IVRS))
                {
                    Case (Zero)
                    {
                        VOFF = 0xC2
                        HOFF = 0x86
                    }
                    Case (0x02)
                    {
                        VOFF = 0x86
                        HOFF = 0xC2
                    }
                    Case (0x04)
                    {
                        VOFF = 0xC2
                        HOFF = 0x86
                    }
                    Case (0x06)
                    {
                        VOFF = 0x86
                        HOFF = 0xC2
                    }

                }
            }

            Return (PLDP)
        }

        Device (CRGB)
        {
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                Return (\IVPR)
            }

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\IVAD)
            }

            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                Return (IV01 (Zero))
            }

            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
            {
                Return (IV02 (Zero))
            }
        }

        Device (CDPT)
        {
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                Return (\IVPR)
            }

            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return ((\IVAD + 0x02))
            }

            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                Return (IV01 (One))
            }

            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
            {
                Return (IV02 (One))
            }
        }

        Method (_PRW, 0, Serialized)  // _PRW: Power Resources for Wake
        {
            If ((\IVWS == One))
            {
                Return (GPRW (0x6D, 0x04))
            }
            Else
            {
                Return (Package (0x02)
                {
                    Zero, 
                    Zero
                })
            }
        }

        Method (_S3D, 0, Serialized)  // _S3D: S3 Device State
        {
            If ((\IVWS == One))
            {
                Return (0x02)
            }
            Else
            {
                Return (0x03)
            }
        }

        Method (_S3W, 0, Serialized)  // _S3W: S3 Device Wake State
        {
            If ((\IVWS == One))
            {
                Return (0x02)
            }
            Else
            {
                Return (0x03)
            }
        }

        Method (_S4D, 0, Serialized)  // _S4D: S4 Device State
        {
            If ((\IVWS == One))
            {
                Return (0x02)
            }
            Else
            {
                Return (0x03)
            }
        }

        Method (_S4W, 0, Serialized)  // _S4W: S4 Device Wake State
        {
            If ((\IVWS == One))
            {
                Return (0x02)
            }
            Else
            {
                Return (0x03)
            }
        }
    }

	Scope (\_SB.PCI0.RP01.PXSX)
	{
		Device (TBL1)
		{
			Name (_ADR, Zero)  // _ADR: Address
		}

		Device (TBL2)
		{
			Name (_ADR, 0x00010000)  // _ADR: Address
		}

		Device (TBL3)
		{
			Name (_ADR, 0x00020000)  // _ADR: Address
			Device (TBTU)
			{
				Name (_ADR, Zero)  // _ADR: Address
				Device (RHUB)
				{
					Name (_ADR, Zero)  // _ADR: Address
					Method (GPLD, 2, Serialized)
					{
						Name (PCKG, Package (0x01)
						{
							Buffer (0x10){}
						})
						CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
						REV = One
						CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
						VISI = Arg0
						CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
						GPOS = Arg1
						Return (PCKG)
					}

					Method (GUPC, 1, Serialized)
					{
						Name (PCKG, Package (0x04)
						{
							Zero, 
							0xFF, 
							Zero, 
							Zero
						})
						PCKG [Zero] = Arg0
						Return (PCKG)
					}

					Method (TPLD, 2, Serialized)
					{
						Name (PCKG, Package (0x01)
						{
							Buffer (0x10){}
						})
						CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
						REV = One
						CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
						VISI = Arg0
						CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
						GPOS = Arg1
						CreateField (DerefOf (PCKG [Zero]), 0x4A, 0x04, SHAP)
						SHAP = One
						CreateField (DerefOf (PCKG [Zero]), 0x20, 0x10, WID)
						WID = 0x08
						CreateField (DerefOf (PCKG [Zero]), 0x30, 0x10, HGT)
						HGT = 0x03
						Return (PCKG)
					}

					Method (TUPC, 1, Serialized)
					{
						Name (PCKG, Package (0x04)
						{
							One, 
							Zero, 
							Zero, 
							Zero
						})
						PCKG [One] = Arg0
						Return (PCKG)
					}

					Device (UB21)
					{
						Name (_ADR, One)  // _ADR: Address
						Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
						{
							Return (TUPC (0x09))
						}

						Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
						{
							Return (TPLD (One, One))
						}
					}

					Device (UB22)
					{
						Name (_ADR, 0x02)  // _ADR: Address
						Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
						{
							Return (GUPC (Zero))
						}

						Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
						{
							Return (GPLD (Zero, Zero))
						}
					}

					Device (UB31)
					{
						Name (_ADR, 0x03)  // _ADR: Address
						Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
						{
							Return (TUPC (0x09))
						}

						Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
						{
							Return (TPLD (One, One))
						}
					}

					Device (UB32)
					{
						Name (_ADR, 0x04)  // _ADR: Address
						Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
						{
							Return (GUPC (Zero))
						}

						Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
						{
							Return (GPLD (Zero, Zero))
						}
					}
				}
			}
		}
    }

	Scope (\_SB.PCI0.RP01.PXSX)
	{
		Name (TUSB, Package (0x02)
		{
			One, 
			0x04
		})
	}

	Scope (\_SB.PCI0.RP09.PXSX)
	{
		Name (TUSB, Package (0x02)
		{
			One, 
			0x02
		})
	}
}
