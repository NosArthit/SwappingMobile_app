/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Accumulate.fromJson(map);
*/ 
class Accumulate {
    int? accumulateCharging;
    int? accumulateDischarging;
    int? masterTimer;

    //Accumulate({this.accumulateCharging, this.accumulateDischarging, this.masterTimer}); 

    Accumulate(
      {required this.accumulateCharging,
      required this.accumulateDischarging,
      required this.masterTimer}
    );

    Accumulate.fromJson(Map<String, dynamic> json) {
        accumulateCharging = json['accumulateCharging'];
        accumulateDischarging = json['accumulateDischarging'];
        masterTimer = json['masterTimer'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['accumulateCharging'] = accumulateCharging;
        data['accumulateDischarging'] = accumulateDischarging;
        data['masterTimer'] = masterTimer;
        return data;
    }
}