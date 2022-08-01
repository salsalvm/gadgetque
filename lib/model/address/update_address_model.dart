import 'dart:convert';

UpdattedAddressModel updattedAddressModelFromJson(String str) => UpdattedAddressModel.fromJson(json.decode(str));

String updattedAddressModelToJson(UpdattedAddressModel data) => json.encode(data.toJson());

class UpdattedAddressModel {
    UpdattedAddressModel({
        required this.acknowledged,
        required this.modifiedCount,
        required this.upsertedId,
        required this.upsertedCount,
        required this.matchedCount,
    });

    bool acknowledged;
    int modifiedCount;
    dynamic upsertedId;
    int upsertedCount;
    int matchedCount;

    factory UpdattedAddressModel.fromJson(Map<String, dynamic> json) => UpdattedAddressModel(
        acknowledged: json["acknowledged"],
        modifiedCount: json["modifiedCount"],
        upsertedId: json["upsertedId"],
        upsertedCount: json["upsertedCount"],
        matchedCount: json["matchedCount"],
    );

    Map<String, dynamic> toJson() => {
        "acknowledged": acknowledged,
        "modifiedCount": modifiedCount,
        "upsertedId": upsertedId,
        "upsertedCount": upsertedCount,
        "matchedCount": matchedCount,
    };
}
