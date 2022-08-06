import 'dart:convert';

QuantityCartItemModel quantityCartItemModelFromJson(String str) => QuantityCartItemModel.fromJson(json.decode(str));

String quantityCartItemModelToJson(QuantityCartItemModel data) => json.encode(data.toJson());

class QuantityCartItemModel {
    QuantityCartItemModel({
        required this.status,
        required this.total,
    });

    bool status;
    int total;

    factory QuantityCartItemModel.fromJson(Map<String, dynamic> json) => QuantityCartItemModel(
        status: json["status"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "total": total,
    };
}