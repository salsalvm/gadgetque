import 'dart:convert';

RemoveAddressModel removeAddressModelFromJson(String str) =>
    RemoveAddressModel.fromJson(json.decode(str));

String removeAddressModelToJson(RemoveAddressModel data) =>
    json.encode(data.toJson());

class RemoveAddressModel {
  RemoveAddressModel({
    required this.resp,
  });

  Resp resp;

  factory RemoveAddressModel.fromJson(Map<String, dynamic> json) =>
      RemoveAddressModel(
        resp: Resp.fromJson(json["resp"]),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp.toJson(),
      };
}

class Resp {
  Resp({
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

  factory Resp.fromJson(Map<String, dynamic> json) => Resp(
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
