import 'dart:convert';

MyOrderModel myOrderModelFromJson(String str) =>
    MyOrderModel.fromJson(json.decode(str));

String myOrderModelToJson(MyOrderModel data) => json.encode(data.toJson());

class MyOrderModel {
  MyOrderModel({
    required this.orders,
    required this.cartCount,
  });

  List<Order>? orders;
  int? cartCount;

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        cartCount: json["cartCount"],
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
        "cartCount": cartCount,
      };
}

class Order {
  Order({
    required this.id,
    required this.deliveryDetails,
    required this.userName,
    required this.userId,
    required this.paymentMethod,
    required this.products,
    required this.totalAmount,
    required this.status,
    required this.dateIso,
    required this.date,
    required this.time,
    required this.coupon,
    required this.cancelled,
  });

  String? id;
  DeliveryDetails? deliveryDetails;
  String? userName;
  String? userId;
  String? paymentMethod;
  List<Product>? products;
  int? totalAmount;
  String? status;
  DateTime? dateIso;
  String? date;
  String? time;
  String? coupon;
  bool? cancelled;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        deliveryDetails: DeliveryDetails.fromJson(json["deliveryDetails"]),
        userName: json["userName"],
        userId: json["userId"],
        paymentMethod: json["paymentMethod"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        totalAmount: json["totalAmount"],
        status: json["status"],
        dateIso: DateTime.parse(json["DateISO"]),
        date: json["Date"],
        time: json["Time"],
        coupon: json["Coupon"],
        cancelled: json["cancelled"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "deliveryDetails": deliveryDetails!.toJson(),
        "userName": userName,
        "userId": userId,
        "paymentMethod": paymentMethod,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "status": status,
        "DateISO": dateIso!.toIso8601String(),
        "Date": date,
        "Time": time,
        "Coupon": coupon,
        "cancelled": cancelled,
      };
}

class DeliveryDetails {
  DeliveryDetails({
    required this.mobile,
    required this.address,
    required this.type,
    required this.pincode,
  });

  String? mobile;
  String ?address;
  String? type;
  String? pincode;

  factory DeliveryDetails.fromJson(Map<String, dynamic> json) =>
      DeliveryDetails(
        mobile: json["mobile"],
        address: json["address"],
        type: json["type"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "address": address,
        "type": type,
        "pincode": pincode,
      };
}

class Product {
  Product({
    required this.item,
    required this.quantity,
    required this.totalAmount,
  });

  String? item;
  int? quantity;
  int? totalAmount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        item: json["item"],
        quantity: json["quantity"],
        totalAmount: json["totalAmount"] == null ? null : json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "quantity": quantity,
        "totalAmount": totalAmount == null ? null : totalAmount,
      };
}
