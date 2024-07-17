import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("user").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView(
            children: snapshot.data!.docs.map((document){
              return Container(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(  
                    children: [
                    
                      SizedBox(height: 100),

                      Text(
                        document["First Name"] + "  " + document["Last Name"],
                        style: TextStyle(
                          fontSize: 30
                        ),
                      ),

                      SizedBox(height: 25),

                      Text(
                        "Mobile:  "+ document["Tel"],
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),

                      SizedBox(height: 15),

                      Text(
                        "Email:  " + document["Email"],
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),

                      SizedBox(height: 15),

                      Text(
                        "Address:  " + document["Address"],
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),
                    ],
                ),
              ));
            }).toList(),           
          );
        },
      ),
    );
  }
}
