// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    SignupModel({
        required this.valid,
    });

    bool valid;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        valid: json["valid"],
    );

    Map<String, dynamic> toJson() => {
        "valid": valid,
    };
}
