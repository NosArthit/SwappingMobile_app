import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_application/pages/first_page.dart';
import 'package:my_application/pages/login_page.dart';
import 'package:my_application/pages/profile_page.dart';
import 'package:my_application/pages/setting.dart';

class DrawerListPage extends StatefulWidget {
  const DrawerListPage({super.key});

  @override
  State<DrawerListPage> createState() => _DrawerListPageState();
}

class _DrawerListPageState extends State<DrawerListPage> {

  final userAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(   
              children: [          
                
                SizedBox(height: 25),
            
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return LoginPage();
                  }));
                }, child: Text('Change profile picture')),

                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return ProfilePage();
                  }));
                }, child: Text('Profile')),
            
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return LoginPage();
                  }));
                }, child: Text('Log In')),
            
                TextButton(onPressed: (){
                  userAuth.signOut().then((value) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return FirstPage();                 
                    }));
                  });      
                }, child: Text('Log Out')),   

                TextButton(onPressed: (){
                  userAuth.signOut().then((value) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return SettingPage();
                    }));
                  });      
                }, child: Text('Setting'))      
              ],
            ),
          ),
        ),
    );
  }
}