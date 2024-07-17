// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height / 2);
    final double itemWidth = size.width / 0.5;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: [
                GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: (itemWidth / itemHeight),
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    //SizedBox(height: 15,),
              
                    Card(
                      color: Colors.teal[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 80,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          children: [
                            SizedBox(height: 3),
                            Text(
                              "Battery Status",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.teal[700],
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(children: [
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "Voltage   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.battery_charging_full,
                                        size: 30, color: Colors.teal[700]),
                                    Text(
                                      ":   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "Current   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.signal_cellular_alt_rounded,
                                        size: 30, color: Colors.teal[700]),
                                    Text(
                                      ":   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "Status     ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.list_rounded,
                                        size: 30, color: Colors.teal[700]),
                                    Text(
                                      ":   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
              
                    Card(
                      color: Colors.teal[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 80,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          children: [
                            SizedBox(height: 3),
                            Text(
                              "Temperature",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.teal[700],
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(children: [
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "Battery Temp.   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.device_thermostat,
                                        size: 25, color: Colors.teal[700]),
                                    Text(
                                      "  :   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "Ambient Temp.   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.wb_sunny_outlined,
                                        size: 25, color: Colors.teal[700]),
                                    Text(
                                      "    :   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "Humidity     ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.wb_cloudy_outlined,
                                        size: 25, color: Colors.teal[700]),
                                    Text(
                                      "    :   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
              
                    Card(
                      color: Colors.teal[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 80,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          children: [
                            SizedBox(height: 3),
                            Text(
                              "Battery Information",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.teal[700],
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(children: [
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "Battery Serial No.   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.verified_user_outlined,
                                        size: 25, color: Colors.teal[700]),
                                    Text(
                                      "  :   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "BMS Status.   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.rule_sharp,
                                        size: 25, color: Colors.teal[700]),
                                    Text(
                                      "    :   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "BMS Error     ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.settings_suggest_sharp,
                                        size: 25, color: Colors.teal[700]),
                                    Text(
                                      "    :   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
              
                    Card(
                      color: Colors.teal[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 80,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          children: [
                            SizedBox(height: 3),
                            Text(
                              "health",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.teal[700],
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(children: [
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "Battery Health.   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.eco_sharp,
                                        size: 25, color: Colors.teal[700]),
                                    Text(
                                      "  :   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(children: [
                                    Text(
                                      "State of Current.   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                    Icon(Icons.flash_on,
                                        size: 25, color: Colors.teal[700]),
                                    Text(
                                      "    :   ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal[700]),
                                    ),
                                  ]),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                          
                  ]),
        
        
            ]),
          ),
        ),
      ),
    );
  }
}
