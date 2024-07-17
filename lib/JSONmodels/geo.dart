/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class BatGeo {
    double? latitude;
    double? longitude;

    BatGeo({
      required this.latitude, 
      required this.longitude
      }); 

    BatGeo.fromJson(Map<String, dynamic> json) {
        latitude = json['_latitude'];
        longitude = json['_longitude'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['_latitude'] = latitude;
        data['_longitude'] = longitude;
        return data;
    }
}

class Msg {
    UserGeo? userGeo;
    NearStationGeo? nearStationGeo;
    BatGeo? batGeo;

    Msg({
      required this.userGeo, 
      required this.nearStationGeo, 
      required this.batGeo
    }); 

    Msg.fromJson(Map<String, dynamic> json) {
        userGeo = json['userGeo'] != null ? UserGeo?.fromJson(json['userGeo']) : null;
        nearStationGeo = json['nearStationGeo'] != null ? NearStationGeo?.fromJson(json['nearStationGeo']) : null;
        batGeo = json['batGeo'] != null ? BatGeo?.fromJson(json['batGeo']) : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['userGeo'] = userGeo!.toJson();
        data['nearStationGeo'] = nearStationGeo!.toJson();
        data['batGeo'] = batGeo!.toJson();
        return data;
    }
}

class NearStationGeo {
    double? latitude;
    double? longitude;

    NearStationGeo({
      required this.latitude, 
      required this.longitude
    }); 

    NearStationGeo.fromJson(Map<String, dynamic> json) {
        latitude = json['_latitude'];
        longitude = json['_longitude'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['_latitude'] = latitude;
        data['_longitude'] = longitude;
        return data;
    }
}

class UserGeo {
    double? latitude;
    double? longitude;

    UserGeo({
      required this.latitude, 
      required this.longitude
    }); 

    UserGeo.fromJson(Map<String, dynamic> json) {
        latitude = json['_latitude'];
        longitude = json['_longitude'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['_latitude'] = latitude;
        data['_longitude'] = longitude;
        return data;
    }
}
