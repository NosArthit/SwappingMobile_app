/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = BatterySpec.fromJson(map);
*/ 
class BatterySpec {
    String? batteryVendorNumber;
    String? bmsSerialNumber;
    int? maxCellTempSpec;
    int? maxCellVoltageSpec;
    int? maxCurrentChargingSpec;

    //BatterySpec({this.batteryVendorNumber, this.bmsSerialNumber, this.maxCellTempSpec, this.maxCellVoltageSpec, this.maxCurrentChargingSpec}); 


    BatterySpec(
      {required this.batteryVendorNumber,
      required this.bmsSerialNumber,
      required this.maxCellVoltageSpec,
      required this.maxCellTempSpec,
      required this.maxCurrentChargingSpec}
    );

    BatterySpec.fromJson(Map<String, dynamic> json) {
        batteryVendorNumber = json['batteryVendorNumber'];
        bmsSerialNumber = json['bmsSerialNumber'];
        maxCellTempSpec = json['maxCellTempSpec'];
        maxCellVoltageSpec = json['maxCellVoltageSpec'];
        maxCurrentChargingSpec = json['maxCurrentChargingSpec'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['batteryVendorNumber'] = batteryVendorNumber;
        data['bmsSerialNumber'] = bmsSerialNumber;
        data['maxCellTempSpec'] = maxCellTempSpec;
        data['maxCellVoltageSpec'] = maxCellVoltageSpec;
        data['maxCurrentChargingSpec'] = maxCurrentChargingSpec;
        return data;
    }
}