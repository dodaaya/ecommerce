import 'package:ecommerce/data/api/api%20manager.dart';
import 'package:ecommerce/data/model/response/RegisterResponse.dart';

import '../../../../domain/repository/auth_repo/data source/auth_remote_DS.dart';

class AuthRemoteDSImpl implements AuthRemoteDS {
  ApiManager apiManager;

  AuthRemoteDSImpl({required this.apiManager});

  @override
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) {
    return apiManager.register(name, email, password, rePassword, phone);
  }
}

AuthRemoteDS injectAuthRemoteDS() {
  return AuthRemoteDSImpl(apiManager: ApiManager.getInstance());
}
