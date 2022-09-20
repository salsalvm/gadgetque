// import 'dart:convert';

// GetProfileModel getProfileModelFromJson(String str) =>
//     GetProfileModel.fromJson(json.decode(str));

// String getProfileModelToJson(GetProfileModel data) =>
//     json.encode(data.toJson());

// class GetProfileModel {
//   GetProfileModel({
//     required this.user,
//     required this.errPassMsg,
//     required this.cartCount,
//     required this.referalLink,
//   });

//   User? user;
//   dynamic errPassMsg;
//   int? cartCount;
//   String? referalLink;

//   factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
//       GetProfileModel(
//         user: User.fromJson(json["user"]),
//         errPassMsg: json["errPassMsg"],
//         cartCount: json["cartCount"],
//         referalLink: json["referalLink"],
//       );

//   Map<String, dynamic> toJson() => {
//         "user": user!.toJson(),
//         "errPassMsg": errPassMsg,
//         "cartCount": cartCount,
//         "referalLink": referalLink,
//       };
// }

// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.mobile,
//     required this.emailaddress,
//     required this.password,
//     required this.confirmPass,
//     required this.refer,
//     required this.referedBy,
//     required this.wallet,
//     required this.address,
//   });

//   String? id;
//   String? name;
//   String? mobile;
//   String? emailaddress;
//   String? password;
//   String? confirmPass;
//   String? refer;
//   String? referedBy;
//   int? wallet;
//   List<Address>? address;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["_id"],
//         name: json["Name"],
//         mobile: json["Mobile"],
//         emailaddress: json["Emailaddress"],
//         password: json["Password"],
//         confirmPass: json["confirmPass"],
//         refer: json["refer"],
//         referedBy: json["referedBy"],
//         wallet: json["wallet"],
//         address:
//             List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "Name": name,
//         "Mobile": mobile,
//         "Emailaddress": emailaddress,
//         "Password": password,
//         "confirmPass": confirmPass,
//         "refer": refer,
//         "referedBy": referedBy,
//         "wallet": wallet,
//         "address": List<dynamic>.from(address!.map((x) => x.toJson())),
//       };
// }

// class Address {
//   Address({
//     required this.addressId,
//     required this.name,
//     required this.mobile,
//     required this.address,
//     required this.type,
//     required this.pincode,
//   });

//   String addressId;
//   String name;
//   String mobile;
//   String address;
//   String type;
//   String pincode;

//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         addressId: json["addressId"],
//         name: json["name"],
//         mobile: json["mobile"],
//         address: json["address"],
//         type: json["type"],
//         pincode: json["pincode"],
//       );

//   Map<String, dynamic> toJson() => {
//         "addressId": addressId,
//         "name": name,
//         "mobile": mobile,
//         "address": address,
//         "type": type,
//         "pincode": pincode,
//       };
// }

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
    GetProfileModel({
        required this.user,
        required this.errPassMsg,
        required this.cartCount,
        required this.referalLink,
        required this.profileMsg,
    });

    User user;
    dynamic errPassMsg;
    int cartCount;
    String referalLink;
    dynamic profileMsg;

    factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
        user: User.fromJson(json["user"]),
        errPassMsg: json["errPassMsg"],
        cartCount: json["cartCount"],
        referalLink: json["referalLink"],
        profileMsg: json["profileMsg"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "errPassMsg": errPassMsg,
        "cartCount": cartCount,
        "referalLink": referalLink,
        "profileMsg": profileMsg,
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.mobile,
        required this.emailaddress,
        required this.password,
        required this.confirmPass,
        required this.refer,
        required this.referedBy,
        required this.wallet,
    });

    String id;
    String name;
    String mobile;
    String emailaddress;
    String password;
    String confirmPass;
    String refer;
    String referedBy;
    int wallet;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["Name"],
        mobile: json["Mobile"],
        emailaddress: json["Emailaddress"],
        password: json["Password"],
        confirmPass: json["confirmPass"],
        refer: json["refer"],
        referedBy: json["referedBy"],
        wallet: json["wallet"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
        "Mobile": mobile,
        "Emailaddress": emailaddress,
        "Password": password,
        "confirmPass": confirmPass,
        "refer": refer,
        "referedBy": referedBy,
        "wallet": wallet,
    };
}
