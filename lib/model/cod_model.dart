import 'dart:convert';

CodModel codModelFromJson(String str) => CodModel.fromJson(json.decode(str));

String codModelToJson(CodModel data) => json.encode(data.toJson());

class CodModel {
    CodModel({
        required this.codSuccess,
    });

    bool codSuccess;

    factory CodModel.fromJson(Map<String, dynamic> json) => CodModel(
        codSuccess: json["codSuccess"],
    );

    Map<String, dynamic> toJson() => {
        "codSuccess": codSuccess,
    };
}
