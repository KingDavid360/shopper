import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
  double? price;
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
        "productName": productName,
        "price": price,
        "quantity": quantity,
        "description": description,
        "image": image,
      };
}
