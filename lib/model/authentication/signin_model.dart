// To parse this JSON data, do
//
//     final signinModel = signinModelFromJson(jsonString);

import 'package:meta/meta.dart';

import 'dart:convert';

SigninModel signinModelFromJson(String str) =>
    SigninModel.fromJson(json.decode(str));

String signinModelToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
  SigninModel({
    required this.response,
  });

  Response response;

  factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class Response {
  Response({
    required this.user,
    required this.status,
  });

  User user;
  bool status;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        user: User.fromJson(json["user"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "status": status,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.mobile,
    required this.emailaddress,
    required this.password,
    required this.confirmPass,
    required this.refer,
    required this.referedBy,
    required this.wallet,
  });

  String id;
  String name;
  String mobile;
  String emailaddress;
  String password;
  String confirmPass;
  String refer;
  String referedBy;
  int? wallet;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["Name"],
        mobile: json["Mobile"],
        emailaddress: json["Emailaddress"],
        password: json["Password"],
        confirmPass: json["confirmPass"],
        refer: json["refer"],
        referedBy: json["referedBy"],
        wallet: json["wallet"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
        "Mobile": mobile,
        "Emailaddress": emailaddress,
        "Password": password,
        "confirmPass": confirmPass,
        "refer": refer,
        "referedBy": referedBy,
        "wallet": wallet,
      };
}
