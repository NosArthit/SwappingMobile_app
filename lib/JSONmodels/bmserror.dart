/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myApp = BmsError.fromJson(map);
*/ 
class BmsError {
    String? cellVolHigh;
    String? cellVolLow;
    String? tempHigh;
    String? temLow;
    String? sumVolHigh;
    String? sumVolLow;
    String? disCurrentOver;
    String? chaCurrentOver;
    String? socHigh;
    String? socLow;
    String? detectTemp;
    String? detectCellVol;
    String? bmsFault;
    String? vcuTimeoutMalfunction;
    String? sumVolDifMalfunction;
    String? portTempHigh;
    String? statePositiveRelay;
    String? stateChargeRelay;
    String? stateNegativeRelay;
    String? statePreChargeRelay;
    String? dcdcRelay;
    String? airPumpRelay;
    String? statusPortTemp;
    int? maxChargeCurrent;

    BmsError({
      required this.cellVolHigh, 
      required this.cellVolLow, 
      required this.tempHigh, 
      required this.temLow, 
      required this.sumVolHigh, 
      required this.sumVolLow, 
      required this.disCurrentOver, 
      required this.chaCurrentOver, 
      required this.socHigh, 
      required this.socLow, 
      required this.detectTemp, 
      required this.detectCellVol, 
      required this.bmsFault, 
      required this.vcuTimeoutMalfunction, 
      required this.sumVolDifMalfunction, 
      required this.portTempHigh, 
      required this.statePositiveRelay, 
      required this.stateChargeRelay, 
      required this.stateNegativeRelay, 
      required this.statePreChargeRelay, 
      required this.dcdcRelay, 
      required this.airPumpRelay, 
      required this.statusPortTemp, 
      required this.maxChargeCurrent
    }); 

    BmsError.fromJson(Map<String, dynamic> json) {
        cellVolHigh = json['cellVolHigh'];
        cellVolLow = json['cellVolLow'];
        tempHigh = json['tempHigh'];
        temLow = json['temLow'];
        sumVolHigh = json['sumVolHigh'];
        sumVolLow = json['sumVolLow'];
        disCurrentOver = json['disCurrentOver'];
        chaCurrentOver = json['chaCurrentOver'];
        socHigh = json['socHigh'];
        socLow = json['socLow'];
        detectTemp = json['detectTemp'];
        detectCellVol = json['detectCellVol'];
        bmsFault = json['bmsFault'];
        vcuTimeoutMalfunction = json['vcuTimeoutMalfunction'];
        sumVolDifMalfunction = json['sumVolDifMalfunction'];
        portTempHigh = json['portTempHigh'];
        statePositiveRelay = json['statePositiveRelay'];
        stateChargeRelay = json['stateChargeRelay'];
        stateNegativeRelay = json['stateNegativeRelay'];
        statePreChargeRelay = json['statePreChargeRelay'];
        dcdcRelay = json['dcdcRelay'];
        airPumpRelay = json['airPumpRelay'];
        statusPortTemp = json['statusPortTemp'];
        maxChargeCurrent = json['maxChargeCurrent'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['cellVolHigh'] = cellVolHigh;
        data['cellVolLow'] = cellVolLow;
        data['tempHigh'] = tempHigh;
        data['temLow'] = temLow;
        data['sumVolHigh'] = sumVolHigh;
        data['sumVolLow'] = sumVolLow;
        data['disCurrentOver'] = disCurrentOver;
        data['chaCurrentOver'] = chaCurrentOver;
        data['socHigh'] = socHigh;
        data['socLow'] = socLow;
        data['detectTemp'] = detectTemp;
        data['detectCellVol'] = detectCellVol;
        data['bmsFault'] = bmsFault;
        data['vcuTimeoutMalfunction'] = vcuTimeoutMalfunction;
        data['sumVolDifMalfunction'] = sumVolDifMalfunction;
        data['portTempHigh'] = portTempHigh;
        data['statePositiveRelay'] = statePositiveRelay;
        data['stateChargeRelay'] = stateChargeRelay;
        data['stateNegativeRelay'] = stateNegativeRelay;
        data['statePreChargeRelay'] = statePreChargeRelay;
        data['dcdcRelay'] = dcdcRelay;
        data['airPumpRelay'] = airPumpRelay;
        data['statusPortTemp'] = statusPortTemp;
        data['maxChargeCurrent'] = maxChargeCurrent;
        return data;
    }
}
