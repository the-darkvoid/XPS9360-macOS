DefinitionBlock ("", "SSDT", 2, "HACK", "BATT", 0)
{
    External(_SB.BAT0, DeviceObj)
    Name(_SB.BAT0.RMCF, Package()
    {
        "UseExtendedBatteryInformationMethod", ">n",
        "UseExtraBatteryInformationMethod", ">n",
    })
}
