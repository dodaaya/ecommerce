import 'package:ecommerce/data/model/response/RegisterResponse.dart';

abstract class AuthRepositoryContract {
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone);

  login(String email, String password);
}
