import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/profile components/user_info_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("user").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      UserInfoCard(
                        title: document["First Name"] + " " + document["Last Name"],
                        content: "",
                        contentSize: 30,
                      ),
                      UserInfoCard(
                        title: "Mobile: ",
                        content: document["Tel"],
                        contentSize: 20,
                      ),
                      UserInfoCard(
                        title: "Email: ",
                        content: document["Email"],
                      ),
                      UserInfoCard(
                        title: "Address: ",
                        content: document["Address"],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

