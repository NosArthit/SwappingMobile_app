import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height / 2);
    final double itemWidth = size.width / 1.1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: (itemWidth / itemHeight),
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[

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
                            Text("Ad", style: TextStyle(fontSize: 30, color: Colors.teal[700], fontWeight: FontWeight.bold),)
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
                            Text("Member Score", style: TextStyle(fontSize: 30, color: Colors.teal[700], fontWeight: FontWeight.bold),)
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
                            Text("Register", style: TextStyle(fontSize: 30, color: Colors.teal[700], fontWeight: FontWeight.bold),)
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
                            Text("Power Unit Price", style: TextStyle(fontSize: 30, color: Colors.teal[700], fontWeight: FontWeight.bold),)
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
                            Text("Oil Price", style: TextStyle(fontSize: 30, color: Colors.teal[700], fontWeight: FontWeight.bold),)
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
                            Text("Ad", style: TextStyle(fontSize: 30, color: Colors.teal[700], fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),

                  ]
                ),
              ],
            ),
          ),

        ),     
      ),
    );
  }
}
