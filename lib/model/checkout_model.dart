import 'dart:convert';

CheckoutDetailsModel checkoutDetailsModelFromJson(String str) =>
    CheckoutDetailsModel.fromJson(json.decode(str));

String checkoutDetailsModelToJson(CheckoutDetailsModel data) =>
    json.encode(data.toJson());

class CheckoutDetailsModel {
  CheckoutDetailsModel({
    required this.total,
    required this.user,
    required this.addresses,
    required this.products,
  });

  int total;
  User user;
  List<CheckoutDetailsModelAddress> addresses;
  List<ProductElement> products;

  factory CheckoutDetailsModel.fromJson(Map<String, dynamic> json) =>
      CheckoutDetailsModel(
        total: json["total"],
        user: User.fromJson(json["user"]),
        addresses: List<CheckoutDetailsModelAddress>.from(json["addresses"]
            .map((x) => CheckoutDetailsModelAddress.fromJson(x))),
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "user": user.toJson(),
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class CheckoutDetailsModelAddress {
  CheckoutDetailsModelAddress({
    required this.address,
  });

  AddressAddress address;

  factory CheckoutDetailsModelAddress.fromJson(Map<String, dynamic> json) =>
      CheckoutDetailsModelAddress(
        address: AddressAddress.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
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

class ProductElement {
  ProductElement({
    required this.id,
    required this.item,
    required this.quantity,
    required this.product,
  });

  String id;
  String item;
  int quantity;
  ProductProduct product;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["_id"],
        item: json["item"],
        quantity: json["quantity"],
        product: ProductProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
        "quantity": quantity,
        "product": product.toJson(),
      };
}

class ProductProduct {
  ProductProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.originalPrice,
    required this.price,
    required this.description,
    required this.imageId,
  });

  String id;
  String name;
  String category;
  String originalPrice;
  String price;
  String description;
  String imageId;

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        id: json["_id"],
        name: json["Name"],
        category: json["Category"],
        originalPrice: json["originalPrice"],
        price: json["Price"],
        description: json["Description"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
        "Category": category,
        "originalPrice": originalPrice,
        "Price": price,
        "Description": description,
        "imageId": imageId,
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
    required this.address,
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
  List<AddressAddress> address;

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
        address: List<AddressAddress>.from(
            json["address"].map((x) => AddressAddress.fromJson(x))),
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
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
      };
}
