import 'dart:convert';

ApplyCouponModel applyCouponModelFromJson(String str) =>
    ApplyCouponModel.fromJson(json.decode(str));

String applyCouponModelToJson(ApplyCouponModel data) =>
    json.encode(data.toJson());

class ApplyCouponModel {
  ApplyCouponModel({
    required this.status,
  });

  bool status;

  factory ApplyCouponModel.fromJson(Map<String, dynamic> json) =>
      ApplyCouponModel(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
