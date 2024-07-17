import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_application/pages/attendancescreen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQR_Page extends StatefulWidget {
  const ScanQR_Page({super.key});

  @override
  State<ScanQR_Page> createState() => _ScanQR_PageState();
}

class _ScanQR_PageState extends State<ScanQR_Page> {

  String barcode = "";
  String result = "";

  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Code Scanner"),),
      body: Column(
        children: [

          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey, 
              onQRViewCreated: _onQRViewCreated,
            )
          ),

          Expanded(
            flex: 1,
            child: Center(
              child: Text("Scan Result"),
            )
          ),

          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: (){
                    if(result.isNotEmpty){
                      Clipboard.setData(ClipboardData(text: result));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Copied to Clipboard"),
                        )
                      );
                    }
                  }, 
                  child: Text("Copy")
                ),

                ElevatedButton(
                  onPressed: ()async {
                    if(result.isNotEmpty){

                      /*final Uri _url = Uri.parse(result);
                      await launchUrl(_url);
                      */

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return AttendanceScreen(scanResult: result,);
                      }));

                    }
                  }, 
                  child: Text("Open")
                ),

              ],
            )
          )
        ]
      ),
    );
  }
}