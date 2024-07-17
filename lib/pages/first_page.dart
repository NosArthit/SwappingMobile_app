import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_application/pages/drawer_list_page.dart';
import 'package:my_application/pages/home_page.dart';
import 'package:my_application/pages/bat_info.dart';
import 'package:my_application/pages/map_page.dart';
import 'package:my_application/pages/scan_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    InfoPage(),
    ScanQRPage(),
    MapPage(),
  ];

  final userAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GRB Ecosystem",
          style: TextStyle(
            color: Colors.teal[700],
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.person, color: Colors.teal),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: const Drawer(
        child: DrawerListPage(),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.teal),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.battery_0_bar_sharp, color: Colors.teal),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code, color: Colors.teal),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ev_station, color: Colors.teal),
            label: 'Find',
          ),
        ],
      ),
    );
  }
}



