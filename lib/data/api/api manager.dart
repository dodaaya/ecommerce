import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/api%20consts.dart';
import 'package:ecommerce/data/api/base%20error.dart';
import 'package:ecommerce/data/model/request/LoginRequest.dart';
import 'package:ecommerce/data/model/request/registerRequest.dart';
import 'package:ecommerce/data/model/response/LoginResponse.dart';
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
  Future<Either<BaseError, RegisterResponse>> register(String name,
      String email, String password, String rePassword, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConsts.baseUrl, ApiConsts.registerApi);
      var requestBody = RegisterRequest(
          name: name,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone);
      var response = await http.post(url, body: requestBody.toJson());
      var registerResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200 || response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return left(BaseError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message));
      }
    } else {
      return left(BaseError(errorMessage: 'Check internet Connection'));
    }
  }

  Future<Either<BaseError, LoginResponse>> login(
      String email, String password) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConsts.baseUrl, ApiConsts.loginApi);
      var requestBody = LoginRequest(email: email, password: password);
      var response = await http.post(url, body: requestBody.toJson());
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200 || response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return left(BaseError(errorMessage: loginResponse.message));
      }
    } else {
      return left(BaseError(errorMessage: 'Check internet Connection'));
    }
  }
}
