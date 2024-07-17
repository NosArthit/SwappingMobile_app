import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_application/pages/bat_info.dart';
import 'package:my_application/pages/first_page.dart';
import 'package:my_application/pages/home_page.dart';
import 'package:my_application/pages/map_page.dart';
import 'package:my_application/pages/scan_page.dart';
//import 'package:my_application/databases/mongodb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyDlYa9OAoE-oQk7klzyy2YvNK40nKi0Mlo',
              appId: '1:74428529898:android:13687c4ce208ed7a316b93',
              messagingSenderId: '74428529898',
              projectId: 'battery-swapping-e3904'))
      : await Firebase.initializeApp();
  
  //await MongoDB.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: FirstPage(),
      routes: {
        '/homepage': (context) => HomePage(),
        '/info': (context) => InfoPage(),
        '/scan': (context) => ScanQR_Page(),
        '/find': (context) => MapPage(),
      },
    );
  }
}
