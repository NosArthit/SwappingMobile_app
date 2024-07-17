/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = CellVoltage2.fromJson(map);
*/ 
class CellVoltage2 {
    int? cellAverageVoltage;
    int? cellDifferenceVotage;
    int? chargeCurrentLimit;
    int? dischargeCurrentLimit;

    //CellVoltage2({this.cellAverageVoltage, this.cellDifferenceVotage, this.chargeCurrentLimit, this.dischargeCurrentLimit}); 

    CellVoltage2(
      {required this.cellAverageVoltage,
      required this.cellDifferenceVotage,
      required this.chargeCurrentLimit,
      required this.dischargeCurrentLimit}
    );

    CellVoltage2.fromJson(Map<String, dynamic> json) {
        cellAverageVoltage = json['cellAverageVoltage'];
        cellDifferenceVotage = json['cellDifferenceVotage'];
        chargeCurrentLimit = json['chargeCurrentLimit'];
        dischargeCurrentLimit = json['dischargeCurrentLimit'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['cellAverageVoltage'] = cellAverageVoltage;
        data['cellDifferenceVotage'] = cellDifferenceVotage;
        data['chargeCurrentLimit'] = chargeCurrentLimit;
        data['dischargeCurrentLimit'] = dischargeCurrentLimit;
        return data;
    }
}