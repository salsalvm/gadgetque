// To parse this JSON data, do
//
//     final categoryDatasModel = categoryDatasModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategoryDatasModel categoryDatasModelFromJson(String str) =>
    CategoryDatasModel.fromJson(json.decode(str));

String categoryDatasModelToJson(CategoryDatasModel data) =>
    json.encode(data.toJson());

class CategoryDatasModel {
  CategoryDatasModel({
    required this.prodata,
    required this.cat,
    required this.cartCount,
  });

  List<Prodatum> prodata;
  String cat;
  int cartCount;

  factory CategoryDatasModel.fromJson(Map<String, dynamic> json) =>
      CategoryDatasModel(
        prodata: List<Prodatum>.from(
            json["prodata"].map((x) => Prodatum.fromJson(x))),
        cat: json["cat"],
        cartCount: json["cartCount"],
      );

  Map<String, dynamic> toJson() => {
        "prodata": List<dynamic>.from(prodata.map((x) => x.toJson())),
        "cat": cat,
        "cartCount": cartCount,
      };
}

class Prodatum {
  Prodatum({
    required this.id,
    required this.name,
    required this.category,
    required this.originalPrice,
    required this.price,
    required this.description,
    required this.imageId,
  });

  String id;
  String name;
  String category;
  String originalPrice;
  String price;
  String description;
  String imageId;

  factory Prodatum.fromJson(Map<String, dynamic> json) => Prodatum(
        id: json["_id"],
        name: json["Name"],
        category: json["Category"],
        originalPrice: json["originalPrice"],
        price: json["Price"],
        description: json["Description"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
        "Category": category,
        "originalPrice": originalPrice,
        "Price": price,
        "Description": description,
        "imageId": imageId,
      };
}
