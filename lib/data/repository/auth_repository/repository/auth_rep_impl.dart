import 'package:ecommerce/data/model/response/RegisterResponse.dart';
import 'package:ecommerce/data/repository/auth_repository/data%20source/auth_remoteDS_impl.dart';
import 'package:ecommerce/domain/repository/auth_repo/data%20source/auth_remote_DS.dart';
import 'package:ecommerce/domain/repository/auth_repo/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDS remoteDS;

  AuthRepositoryImpl({required this.remoteDS});

  @override
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) {
    return remoteDS.register(name, email, password, rePassword, phone);
  }
}

AuthRepositoryContract injectAuthRepo() {
  return AuthRepositoryImpl(remoteDS: injectAuthRemoteDS());
}
