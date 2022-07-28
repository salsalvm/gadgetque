// To parse this JSON data, do
//
//     final homeDatasModel = homeDatasModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomeDatasModel homeDatasModelFromJson(String str) => HomeDatasModel.fromJson(json.decode(str));

String homeDatasModelToJson(HomeDatasModel data) => json.encode(data.toJson());

class HomeDatasModel {
    HomeDatasModel({
        required this.products,
        required this.category,
        required this.cartCount,
        required this.allCoupons,
        required this.homePage,
    });

    List<Product> products;
    List<Category> category;
    int cartCount;
    List<dynamic> allCoupons;
    bool homePage;

    factory HomeDatasModel.fromJson(Map<String, dynamic> json) => HomeDatasModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
        cartCount: json["cartCount"],
        allCoupons: List<dynamic>.from(json["allCoupons"].map((x) => x)),
        homePage: json["homePage"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "cartCount": cartCount,
        "allCoupons": List<dynamic>.from(allCoupons.map((x) => x)),
        "homePage": homePage,
    };
}

class Category {
    Category({
        required this.id,
        required this.category,
    });

    String id;
    String category;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        category: json["Category"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Category": category,
    };
}

class Product {
    Product({
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

    factory Product.fromJson(Map<String, dynamic> json) => Product(
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
