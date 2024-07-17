/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = CellVoltage1.fromJson(map);
*/ 
class CellVoltage1 {
    int? cellMaxVoltage;
    int? cellMinVoltage;
    String? maxVoltageCellNumber;
    String? maxVoltageGroupNumber;
    String? minVoltageCellNumber;
    String? minVoltageGroupNumber;

    //CellVoltage1({this.cellMaxVoltage, this.cellMinVoltage, this.maxVoltageCellNumber, this.maxVoltageGroupNumber, this.minVoltageCellNumber, this.minVoltageGroupNumber}); 

    CellVoltage1(
      {required this.cellMaxVoltage,
      required this.cellMinVoltage,
      required this.maxVoltageCellNumber,
      required this.maxVoltageGroupNumber,
      required this.minVoltageCellNumber,
      required this.minVoltageGroupNumber}
    );

    CellVoltage1.fromJson(Map<String, dynamic> json) {
        cellMaxVoltage = json['cellMaxVoltage'];
        cellMinVoltage = json['cellMinVoltage'];
        maxVoltageCellNumber = json['maxVoltageCellNumber'];
        maxVoltageGroupNumber = json['maxVoltageGroupNumber'];
        minVoltageCellNumber = json['minVoltageCellNumber'];
        minVoltageGroupNumber = json['minVoltageGroupNumber'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['cellMaxVoltage'] = cellMaxVoltage;
        data['cellMinVoltage'] = cellMinVoltage;
        data['maxVoltageCellNumber'] = maxVoltageCellNumber;
        data['maxVoltageGroupNumber'] = maxVoltageGroupNumber;
        data['minVoltageCellNumber'] = minVoltageCellNumber;
        data['minVoltageGroupNumber'] = minVoltageGroupNumber;
        return data;
    }
}