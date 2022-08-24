import 'dart:convert';

ApplyCouponUsed applyCouponUsedFromJson(String str) => ApplyCouponUsed.fromJson(json.decode(str));

String applyCouponUsedToJson(ApplyCouponUsed data) => json.encode(data.toJson());

class ApplyCouponUsed {
    ApplyCouponUsed({
        required this.isUsed,
    });

    bool isUsed;

    factory ApplyCouponUsed.fromJson(Map<String, dynamic> json) => ApplyCouponUsed(
        isUsed: json["isUsed"],
    );

    Map<String, dynamic> toJson() => {
        "isUsed": isUsed,
    };
}
