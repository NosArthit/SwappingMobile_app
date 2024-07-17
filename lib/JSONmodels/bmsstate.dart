/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = BmsState.fromJson(map);
*/ 
class BmsState {
    int? sysVoltage;
    int? sysCurrent;
    int? sysSoc;
    String? sysStatus;
    String? chargeLink;
    String? chargeIndicator;
    String? errLevel;
    String? selfCheck;
    String? powerOffRequest;
    String? insulationFade;
    int? canCounter;

    //BmsState({this.sysVoltage, this.sysCurrent, this.sysSoc, this.sysStatus, this.chargeLink, this.chargeIndicator, this.errLevel, this.selfCheck, this.powerOffRequest, this.insulationFade, this.canCounter}); 

    BmsState({
    required this.sysVoltage,
    required this.sysCurrent,
    required this.sysSoc,
    required this.sysStatus,
    required this.chargeLink,
    required this.chargeIndicator,
    required this.errLevel,
    required this.selfCheck,
    required this.powerOffRequest,
    required this.insulationFade,
    required this.canCounter,
    });
  
    BmsState.fromJson(Map<String, dynamic> json) {
        sysVoltage = json['sysVoltage'];
        sysCurrent = json['sysCurrent'];
        sysSoc = json['sysSoc'];
        sysStatus = json['sysStatus'];
        chargeLink = json['chargeLink'];
        chargeIndicator = json['chargeIndicator'];
        errLevel = json['errLevel'];
        selfCheck = json['selfCheck'];
        powerOffRequest = json['powerOffRequest'];
        insulationFade = json['insulationFade'];
        canCounter = json['canCounter'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['sysVoltage'] = sysVoltage;
        data['sysCurrent'] = sysCurrent;
        data['sysSoc'] = sysSoc;
        data['sysStatus'] = sysStatus;
        data['chargeLink'] = chargeLink;
        data['chargeIndicator'] = chargeIndicator;
        data['errLevel'] = errLevel;
        data['selfCheck'] = selfCheck;
        data['powerOffRequest'] = powerOffRequest;
        data['insulationFade'] = insulationFade;
        data['canCounter'] = canCounter;
        return data;
    }
}
