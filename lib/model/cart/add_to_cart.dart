
import 'package:meta/meta.dart';
import 'dart:convert';

AddCartModel addCartModelFromJson(String str) => AddCartModel.fromJson(json.decode(str));

String addCartModelToJson(AddCartModel data) => json.encode(data.toJson());

class AddCartModel {
    AddCartModel({
        required this.status,
    });

    bool status;

    factory AddCartModel.fromJson(Map<String, dynamic> json) => AddCartModel(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
