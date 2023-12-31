import 'dart:convert';

import 'package:ecommerce/data/api/api%20consts.dart';
import 'package:ecommerce/data/model/request/registerRequest.dart';
import 'package:ecommerce/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  //https://ecommerce.routemisr.com/api/v1/auth/signup
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) async {
    Uri url = Uri.https(ApiConsts.baseUrl, ApiConsts.registerApi);
    var requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);
    var response = await http.post(url, body: requestBody.toJson());
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }
}
