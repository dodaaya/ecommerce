import 'package:ecommerce/data/model/response/RegisterResponse.dart';

abstract class AuthRemoteDS {
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone);
}
