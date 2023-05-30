import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
// import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopper/api/models/merchant/merchant_profile_model.dart';

import '../api_helpers.dart';
import '../api_routes.dart';

class MerchantController extends GetxController {
  // static MerchantController get instance => Get.find();

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

  MerchantModel merchantModel = MerchantModel();

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
        ApiRoute.merchantSignUp,
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

  Future<bool> createProduct({
    String? productName,
    double? price,
    int? quantity,
    String? description,
    String? image,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Map<String, dynamic> val = {
        "productName": productName,
        "price": price,
        "quantity": quantity,
        "description": description,
        // "image": image,
      };
      FormData formData;
      MultipartFile productImage;
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      Map<String, dynamic> noMediaReq = {}..addAll(val);

      productImage = await MultipartFile.fromFile(
        image!,
        filename: '$id/${image}',
      );
      formData = FormData.fromMap(val..addAll({"image": productImage}));
      var responseBody = await Api().post(
          ApiRoute.createProduct, await headerWithToken(), noMediaReq,
          multimediaRequest: formData);

      var response = jsonDecode(responseBody);
      print(responseBody);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
