// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    required this.response,
  });

  Response response;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class Response {
  Response({
    required this.acknowledged,
    required this.insertedId,
  });

  bool acknowledged;
  String insertedId;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        acknowledged: json["acknowledged"],
        insertedId: json["insertedId"],
      );

  Map<String, dynamic> toJson() => {
        "acknowledged": acknowledged,
        "insertedId": insertedId,
      };
}
