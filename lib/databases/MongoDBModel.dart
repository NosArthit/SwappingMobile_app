// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
    ObjectId id;
    String firstName;
    String lastName;
    String cardId;
    String tel;
    String email;
    String address;

    MongoDbModel({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.cardId,
        required this.tel,
        required this.email,
        required this.address,
    });

    factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        cardId: json["cardId"],
        tel: json["tel"],
        email: json["email"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "cardId": cardId,
        "tel": tel,
        "email": email,
        "address": address,
    };
}
