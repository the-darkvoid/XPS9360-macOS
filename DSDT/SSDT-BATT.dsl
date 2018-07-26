DefinitionBlock ("", "SSDT", 2, "HACK", "BATT", 0)
{
    External(_SB.BAT0, DeviceObj)
    Name(_SB.BAT0.RMCF, Package()
    {
        "UseExtendedBatteryInformationMethod", ">n",
        "UseExtraBatteryInformationMethod", ">n",
        "EstimateCycleCountDivisor", 6,
        "UseDesignVoltageForDesignCapacity", ">y",
        "UseDesignVoltageForMaxCapacity", ">y",
        "UseDesignVoltageForCurrentCapacity", ">y",
        "CurrentDischargeRateMax", 20000,
        "CorrectCorruptCapacities", ">y",
        "Correct16bitSignedCurrentRate", ">y",
        "StartupDelay", 0,
        "FirstPollDelay", 3999,
    })
}
