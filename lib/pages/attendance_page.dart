
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_application/pages/first_page.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key, required this.scanResult})
      : super(key: key);
  final String scanResult;

  @override
  State<AttendancePage> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendancePage> {
  bool buildWidgets = false;

  @override
  void initState() {
    super.initState();
    checkKey();
  }

  Future<void> checkKey() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("Station")
        .doc("StationNo1")
        .get();

    String key = "Station ID:  " +
        snap['id'] +
        "\r\n" +
        "Station Password:  " +
        snap['password'];

    if (widget.scanResult == key) {
      debugPrint("True");
      setState(() {
        buildWidgets = true;
      });
    } else {
      debugPrint("False");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const FirstPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildWidgets
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection("user")
                          .doc('kdJWiitMwkNdmxdd3mla')
                          .update({
                            'checkIn': Timestamp.now().toDate(),
                          }).then((value) {
                              Fluttertoast.showToast(
                              msg: "Checked In successfully",
                              gravity: ToastGravity.TOP);
                              Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                                  return FirstPage();
                                })
                              );
                          });
                    },
                    child: button("CHECK IN"),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection("user")
                          .doc('kdJWiitMwkNdmxdd3mla')
                          .update({
                        'checkOut': Timestamp.now().toDate(),
                      }).then((value) {
                        Fluttertoast.showToast(
                            msg: "Checked Out successfully",
                            gravity: ToastGravity.TOP);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return FirstPage();
                        }));
                      });
                    },
                    child: button("CHECK OUT"),
                  ),
                ],
              )
            : const SizedBox(),
      ),
    );
  }

  Widget button(String text) {
    return Container(
      height: 80,
      width: 150,
      color: Colors.teal[100],
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.teal[700],
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
