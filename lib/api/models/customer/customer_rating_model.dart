import 'dart:convert';

RatingModel ratingModelFromJson(String str) =>
    RatingModel.fromJson(json.decode(str));

String ratingModelToJson(RatingModel data) => json.encode(data.toJson());

class RatingModel {
  RatingModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
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
    this.productId,
    this.rating,
  });

  String? productId;
  int? rating;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["productId"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "rating": rating,
      };
}
