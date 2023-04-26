import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopper/api/api_helpers.dart';
import 'package:shopper/api/api_routes.dart';
import 'package:shopper/api/models/customer/user_profile_model.dart';

class CustomerController extends GetxController {
  static CustomerController get instance => Get.find();

  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  Future<Map<String, String>> headerWithToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, String> headerToken = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };
    return headerToken;
  }

  UserModel userModel = UserModel();

  Future<bool> signUp({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      Map<String, dynamic> val = {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
      };
      var responseBody = await Api().post(
        ApiRoute.signUp,
        header,
        jsonEncode(val),
      );
      var response = jsonDecode(responseBody);
      prefs.setString("token", response["token"]);
      print(responseBody);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      Map<String, dynamic> val = {
        "email": email,
        "password": password,
      };
      var responseBody =
          await Api().post(ApiRoute.login, header, jsonEncode(val));
      var response = jsonDecode(responseBody);

      print(response["token"]);
      prefs.setString("token", response["token"]);
      print(responseBody);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
