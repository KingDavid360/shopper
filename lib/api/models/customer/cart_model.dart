import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.productId,
    this.productName,
    this.price,
    this.quantity,
    this.description,
    this.image,
    this.owner,
  });

  int? id;
  String? productId;
  String? productName;
  String? price;
  int? quantity;
  String? description;
  String? image;
  int? owner;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productId: json["productId"],
        productName: json["productName"],
        price: json["price"],
        quantity: json["quantity"],
        description: json["description"],
        image: json["image"],
        owner: json["owner"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "price": price,
        "quantity": quantity,
        "description": description,
        "image": image,
        "owner": owner,
      };
}
