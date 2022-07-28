import 'package:meta/meta.dart';
import 'dart:convert';

RemoveCartModel removeCartModelFromJson(String str) => RemoveCartModel.fromJson(json.decode(str));

String removeCartModelToJson(RemoveCartModel data) => json.encode(data.toJson());

class RemoveCartModel {
    RemoveCartModel({
        required this.removeProduct,
    });

    bool removeProduct;

    factory RemoveCartModel.fromJson(Map<String, dynamic> json) => RemoveCartModel(
        removeProduct: json["removeProduct"],
    );

    Map<String, dynamic> toJson() => {
        "removeProduct": removeProduct,
    };
}