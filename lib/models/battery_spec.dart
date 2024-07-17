class BatterySpec{
  String? batteryVendorNumber;
  String? bmsSerialNumber;
  String? maxCellVoltageSpec;
  String? maxCellTempSpec;
  String? maxCurrentChargingSpec;

  BatterySpec({
    required this.batteryVendorNumber,
    required this.bmsSerialNumber,
    required this.maxCellVoltageSpec,
    required this.maxCellTempSpec,
    required this.maxCurrentChargingSpec
  });
}