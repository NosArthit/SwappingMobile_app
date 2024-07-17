// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:my_application/databases/MongoDBModel.dart';
import 'package:my_application/databases/mongodb.dart';

class MongoDbInsert extends StatefulWidget {
  const MongoDbInsert({super.key});

  @override
  State<MongoDbInsert> createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {
  var fName = new TextEditingController();
  var lName = new TextEditingController();
  var cardId = new TextEditingController();
  var tel = new TextEditingController();
  var email = new TextEditingController();
  var address = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Please insert your information",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(labelText: "First Name"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Last Name"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Nationality Card ID"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Tel."),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(labelText: "Address"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  OutlinedButton(
                    onPressed: (){
                       setState(() {
                         
                       });
                    }, 
                    child: Text("Go Back")), 
                  ElevatedButton(
                    onPressed: (){
                      _insertData(fName.text,lName.text,cardId.text,tel.text,email.text,address.text);
                    }, child: Text("Register"))
                ],
              )
            ],
          ),
        )
      )
    );
  }

  Future<void> _insertData(String fName, String lName, String cardId, String tel, String email, String address) async{
    var _id = M.ObjectId();
    final data = MongoDbModel(id: _id, firstName: fName, lastName: lName, cardId: cardId, tel: tel, email: email, address: address);
    // ignore: unused_local_variable
    var result = await MongoDB.insert(data);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Inserted ID "+ _id.toString())));
    _clearAll();
  }

  void _clearAll (){
    fName.text = "";
    lName.text = "";
    cardId.text = "";
    tel.text = "";
    email.text = "";
    address.text = "";
  }
}
