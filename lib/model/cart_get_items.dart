import 'dart:convert';

GetCartItemsModel getCartItemsModelFromJson(String str) =>
    GetCartItemsModel.fromJson(json.decode(str));

String getCartItemsModelToJson(GetCartItemsModel data) =>
    json.encode(data.toJson());

class GetCartItemsModel {
  GetCartItemsModel({
    required this.user,
    required this.products,
    required this.total,
    required this.cartCount,
  });

  String user;
  List<ProductElement>? products;
  int? total;
  int? cartCount;

  factory GetCartItemsModel.fromJson(Map<String, dynamic> json) =>
      GetCartItemsModel(
        user: json["user"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        total: json["total"],
        cartCount: json["cartCount"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "cartCount": cartCount,
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

  String? id;
  String? name;
  String? category;
  String? originalPrice;
  String? price;
  String? description;
  String? imageId;

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
