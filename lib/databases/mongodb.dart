import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_application/databases/MongoDBModel.dart';
import 'package:my_application/databases/constant.dart';

class MongoDB{
  static var db, userCollection;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getData() async{
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<String> insert(MongoDbModel data) async{
    try{
      var result = await userCollection.insertOne(data.toJson());
      if(result.isSuccess){
        return "Register Completed";
      }
      else{
        return "Somthing was wrong while registration";
      }
    } catch (e){
      print(e.toString());
      return e.toString();
    }
  }

}