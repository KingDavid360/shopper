import 'dart:convert';

MerchantLoginModel merchantLoginModelFromJson(String str) =>
    MerchantLoginModel.fromJson(json.decode(str));

String merchantLoginModelToJson(MerchantLoginModel data) =>
    json.encode(data.toJson());

class MerchantLoginModel {
  MerchantLoginModel({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory MerchantLoginModel.fromJson(Map<String, dynamic> json) =>
      MerchantLoginModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
