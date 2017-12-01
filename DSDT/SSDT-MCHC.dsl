//
// SSDT-MCHC.dsl
//
// Dell XPS 15 9560 
//
// This SSDT adds the missing Memory (DRAM) Controller to the system.
//
// Credit to syscl:
// https://github.com/syscl/XPS9350-macOS
//

DefinitionBlock("", "SSDT", 2, "hack", "MCHC", 0)
{
    External(_SB.PCI0, DeviceObj)

    Scope(_SB.PCI0)
    {
		Device (MCHC)
		{
		    Name (_ADR, Zero)
		}
	}
}