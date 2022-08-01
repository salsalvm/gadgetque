import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
    UpdateProfileModel({
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

    factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
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
