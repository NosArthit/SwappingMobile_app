import 'package:flutter/material.dart';
import '../components/batinfo components/info_card.dart';
import '../components/batinfo components/info_row.dart';
import '../fetchModels/battery_status.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  var bmsState;
  var cellVol1;
  var cellVol2;
  var cellTemp;
  var batterySpec;
  var accumulate;
  var soh;
  var apiKey = '487e2adc2df6b08000d6803365af3562';
  var batGeo;
  var weather;
  var resWeather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: [
                FutureBuilder(
                  future: BatteryStatus(
                    bmsState: bmsState,
                    cellVol1: cellVol1,
                    cellVol2: cellVol2,
                    cellTemp: cellTemp,
                    batterySpec: batterySpec,
                    accumulate: accumulate,
                    soh: soh,
                    apiKey: apiKey,
                    batGeo: batGeo,
                    weather: weather,
                    resWeather: resWeather,
                  ),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          InfoCard(
                            title: "Battery Status",
                            content: Column(
                              children: [
                                InfoRow(
                                  label: "Voltage",
                                  value: "${(bmsState.sysVoltage * 0.1).toString()} V",
                                  icon: Icons.battery_charging_full,
                                ),
                                InfoRow(
                                  label: "Current",
                                  value: "${bmsState.sysCurrent.toString()} Amh",
                                  icon: Icons.signal_cellular_alt_rounded,
                                ),
                                InfoRow(
                                  label: "State of Charge",
                                  value: "${((bmsState.sysVoltage / 80.0) * 10).toString()} %",
                                  icon: Icons.flash_on,
                                ),
                              ],
                            ),
                          ),
                          InfoCard(
                            title: "Temperature",
                            content: Column(
                              children: [
                                InfoRow(
                                  label: "Battery Temp.",
                                  value: "${cellTemp.cellAverageTemp.toString()} °C",
                                  icon: Icons.device_thermostat,
                                ),
                                InfoRow(
                                  label: "Ambient Temp.",
                                  value: "${(weather.temp * 0.1).toStringAsFixed(1)} °C",
                                  icon: Icons.wb_sunny_outlined,
                                ),
                                InfoRow(
                                  label: "Humidity",
                                  value: "${weather.humidity.toString()} RH (%)",
                                  icon: Icons.wb_cloudy_outlined,
                                ),
                              ],
                            ),
                          ),
                          InfoCard(
                            title: "Battery Information",
                            content: Column(
                              children: [
                                InfoRow(
                                  label: "Nominal Voltage",
                                  value: "${batterySpec.nominalVolt.toString()} V",
                                  icon: Icons.electrical_services,
                                ),
                                InfoRow(
                                  label: "Capacity",
                                  value: "${batterySpec.nominalCapacity.toString()} mAh",
                                  icon: Icons.battery_full,
                                ),
                                InfoRow(
                                  label: "Cycle",
                                  value: "${accumulate.cycleCount.toString()}",
                                  icon: Icons.refresh,
                                ),
                              ],
                            ),
                          ),
                          InfoCard(
                            title: "Battery SoH",
                            content: InfoRow(
                              label: "State of Health",
                              value: "${soh.soh.toString()} %",
                              icon: Icons.health_and_safety,
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return const Text("Error fetching battery status");
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



