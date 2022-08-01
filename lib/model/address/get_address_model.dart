import 'dart:convert';

GetAddressModel getAddressModelFromJson(String str) => GetAddressModel.fromJson(json.decode(str));

String getAddressModelToJson(GetAddressModel data) => json.encode(data.toJson());

class GetAddressModel {
    GetAddressModel({
        required this.user,
        required this.cartCount,
        required this.addresses,
    });

    bool user;
    int cartCount;
    List<AddressElement> addresses;

    factory GetAddressModel.fromJson(Map<String, dynamic> json) => GetAddressModel(
        user: json["user"],
        cartCount: json["cartCount"],
        addresses: List<AddressElement>.from(json["addresses"].map((x) => AddressElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "cartCount": cartCount,
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
    };
}

class AddressElement {
    AddressElement({
        required this.address,
    });

    AddressAddress? address;

    factory AddressElement.fromJson(Map<String, dynamic> json) => AddressElement(
        address: AddressAddress.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "address": address!.toJson(),
    };
}

class AddressAddress {
    AddressAddress({
        required this.addressId,
        required this.name,
        required this.mobile,
        required this.address,
        required this.type,
        required this.pincode,
    });

    String? addressId;
    String? name;
    String? mobile;
    String? address;
    String? type;
    String? pincode;

    factory AddressAddress.fromJson(Map<String, dynamic> json) => AddressAddress(
        addressId: json["addressId"],
        name: json["name"],
        mobile: json["mobile"],
        address: json["address"],
        type: json["type"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "addressId": addressId,
        "name": name,
        "mobile": mobile,
        "address": address,
        "type": type,
        "pincode": pincode,
    };
}
