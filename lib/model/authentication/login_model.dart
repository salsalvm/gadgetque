// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.response,
  });

  Response response;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
  int wallet;

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
