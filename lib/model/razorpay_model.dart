import 'dart:convert';

RazorPayModel razorPayModelFromJson(String str) => RazorPayModel.fromJson(json.decode(str));

String razorPayModelToJson(RazorPayModel data) => json.encode(data.toJson());

class RazorPayModel {
    RazorPayModel({
        required this.codSuccess,
    });

    bool codSuccess;

    factory RazorPayModel.fromJson(Map<String, dynamic> json) => RazorPayModel(
        codSuccess: json["codSuccess"],
    );

    Map<String, dynamic> toJson() => {
        "codSuccess": codSuccess,
    };
}
