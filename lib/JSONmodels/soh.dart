/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = SOH.fromJson(map);
*/ 
class SOH {
    int? soh;

    SOH({
      required this.soh
    }); 

    SOH.fromJson(Map<String, dynamic> json) {
        soh = json['soh'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['soh'] = soh;
        return data;
    }
}