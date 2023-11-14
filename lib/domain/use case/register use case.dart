import 'package:ecommerce/data/model/response/RegisterResponse.dart';
import 'package:ecommerce/data/repository/auth_repository/repository/auth_rep_impl.dart';
import 'package:ecommerce/domain/repository/auth_repo/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repoContract;

  RegisterUseCase({required this.repoContract});

  Future<RegisterResponse> invoke(String name, String email, String password,
      String rePassword, String phone) {
    return repoContract.register(name, email, password, rePassword, phone);
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repoContract: injectAuthRepo());
}
