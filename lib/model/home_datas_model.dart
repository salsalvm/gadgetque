import 'dart:convert';

HomeDatasModel homeDatasModelFromJson(String str) =>
    HomeDatasModel.fromJson(json.decode(str));

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
  List<AllCoupon> allCoupons;
  bool homePage;

  factory HomeDatasModel.fromJson(Map<String, dynamic> json) => HomeDatasModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        cartCount: json["cartCount"],
        allCoupons: List<AllCoupon>.from(
            json["allCoupons"].map((x) => AllCoupon.fromJson(x))),
        homePage: json["homePage"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "cartCount": cartCount,
        "allCoupons": List<dynamic>.from(allCoupons.map((x) => x.toJson())),
        "homePage": homePage,
      };
}

class AllCoupon {
  AllCoupon({
    required this.id,
    required this.coupon,
    required this.couponCategory,
    required this.offer,
    required this.expiry,
    required this.endDateIso,
    required this.users,
  });

  String id;
  String coupon;
  dynamic couponCategory;
  int offer;
  DateTime expiry;
  DateTime endDateIso;
  List<dynamic> users;

  factory AllCoupon.fromJson(Map<String, dynamic> json) => AllCoupon(
        id: json["_id"],
        coupon: json["Coupon"],
        couponCategory: json["couponCategory"],
        offer: json["Offer"],
        expiry: DateTime.parse(json["Expiry"]),
        endDateIso: DateTime.parse(json["endDateIso"]),
        users: List<dynamic>.from(json["Users"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Coupon": coupon,
        "couponCategory": couponCategory,
        "Offer": offer,
        "Expiry":
            "${expiry.year.toString().padLeft(4, '0')}-${expiry.month.toString().padLeft(2, '0')}-${expiry.day.toString().padLeft(2, '0')}",
        "endDateIso": endDateIso.toIso8601String(),
        "Users": List<dynamic>.from(users.map((x) => x)),
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
