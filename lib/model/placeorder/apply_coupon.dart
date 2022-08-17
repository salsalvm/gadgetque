// To parse this JSON data, do
//
//     final applyCouponModel = applyCouponModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ApplyCouponModel applyCouponModelFromJson(String str) => ApplyCouponModel.fromJson(json.decode(str));

String applyCouponModelToJson(ApplyCouponModel data) => json.encode(data.toJson());

class ApplyCouponModel {
    ApplyCouponModel({
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
    int? offer;
    DateTime expiry;
    DateTime endDateIso;
    List<dynamic> users;

    factory ApplyCouponModel.fromJson(Map<String, dynamic> json) => ApplyCouponModel(
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
        "Expiry": "${expiry.year.toString().padLeft(4, '0')}-${expiry.month.toString().padLeft(2, '0')}-${expiry.day.toString().padLeft(2, '0')}",
        "endDateIso": endDateIso.toIso8601String(),
        "Users": List<dynamic>.from(users.map((x) => x)),
    };
}
