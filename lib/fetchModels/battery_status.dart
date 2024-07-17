import 'dart:convert';
import 'package:http/http.dart' as http;

import '../JSONmodels/accumulate.dart';
import '../JSONmodels/batteryspec.dart';
import '../JSONmodels/bmsstate.dart';
import '../JSONmodels/celltemp.dart';
import '../JSONmodels/cellvol1.dart';
import '../JSONmodels/cellvol2.dart';
import '../JSONmodels/geo.dart';
import '../JSONmodels/soh.dart';
import '../JSONmodels/weather.dart';

Future<String> BatteryStatus({
  required var bmsState,
  required var cellVol1,
  required var cellVol2,
  required var cellTemp,
  required var batterySpec,
  required var accumulate,
  required var soh,
  required var apiKey,
  required var batGeo,
  required var weather,
  required var resWeather,
}) async {
  var response = await Future.wait([
    http.get(Uri.parse(
        "https://asia-southeast1-battery-swapping-e3904.cloudfunctions.net/bmsstate/v1/bmsstates/bat01")),
    http.get(Uri.parse(
        "https://asia-southeast1-battery-swapping-e3904.cloudfunctions.net/celltemp/v1/celltemps/bat01")),
    http.get(Uri.parse(
        "https://asia-southeast1-battery-swapping-e3904.cloudfunctions.net/cellvol1/v1/cellvols1/bat01")),
    http.get(Uri.parse(
        "https://asia-southeast1-battery-swapping-e3904.cloudfunctions.net/cellvol2/v1/cellvols2/bat01")),
    http.get(Uri.parse(
        "https://asia-southeast1-battery-swapping-e3904.cloudfunctions.net/accumulate/v1/accumulates/bat01")),
    http.get(Uri.parse(
        "https://asia-southeast1-battery-swapping-e3904.cloudfunctions.net/soh/v1/sohes/bat01")),
    http.get(Uri.parse(
        "https://asia-southeast1-battery-swapping-e3904.cloudfunctions.net/batteryspec/v1/batspecs/bat01")),
    http.get(Uri.parse("https://asia-southeast1-battery-swapping-e3904.cloudfunctions.net/geo/v1/geoes/bat01"))
  ]);

  bmsState = BmsState.fromJson(jsonDecode(utf8.decode(response[0].bodyBytes))['msg']);
  cellTemp = CellTemp.fromJson(jsonDecode(utf8.decode(response[1].bodyBytes))['msg']);
  cellVol1 = CellVoltage1.fromJson(jsonDecode(utf8.decode(response[2].bodyBytes))['msg']);
  cellVol2 = CellVoltage2.fromJson(jsonDecode(utf8.decode(response[3].bodyBytes))['msg']);
  accumulate = Accumulate.fromJson(jsonDecode(utf8.decode(response[4].bodyBytes))['msg']);
  soh = SOH.fromJson(jsonDecode(utf8.decode(response[5].bodyBytes))['msg']);
  batterySpec = BatterySpec.fromJson(jsonDecode(utf8.decode(response[6].bodyBytes))['msg']);
  batGeo = Msg.fromJson(jsonDecode(utf8.decode(response[7].bodyBytes))['msg']);

  resWeather = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${batGeo.geoLat}&lon=${batGeo.geoLong}&appid=${apiKey}'));
  weather = Weather.fromJson(jsonDecode(resWeather.body));

  return 'complete';
}
