import 'package:flutter/material.dart';
import 'package:my_application/pages/login_page.dart';

class ForgotPassWord extends StatefulWidget {
  const ForgotPassWord({super.key});

  @override
  State<ForgotPassWord> createState() => _ForgotPassWordState();
}

class _ForgotPassWordState extends State<ForgotPassWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Please insert your information to recover your password",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(labelText: "First Name"),
              ),

              SizedBox(height: 10),

              TextField(
                decoration: InputDecoration(labelText: "Last Name"),
              ),

              SizedBox(height: 10),

              TextField(
                decoration: InputDecoration(labelText: "Nationality Card ID"),
              ),

              SizedBox(height: 10),

              TextField(
                decoration: InputDecoration(labelText: "Tel."),
              ),

              SizedBox(height: 10),

              TextField(
                decoration: InputDecoration(labelText: "Email"),
              ),

              SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  OutlinedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return LoginPage();
                        }
                      ));
                    }, 
                    child: Text("Go Back")), 
                  ElevatedButton(
                    onPressed: (){
                      
                    }, 
                    child: Text("Send OTP"))
                ],
              )
            ]
          )
        )
      )
    );
  }
}