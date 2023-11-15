import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/base%20error.dart';
import 'package:ecommerce/data/model/response/RegisterResponse.dart';
import 'package:ecommerce/data/repository/auth_repository/repository/auth_rep_impl.dart';
import 'package:ecommerce/domain/entities/auth%20result%20entity.dart';
import 'package:ecommerce/domain/repository/auth_repo/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repoContract;

  RegisterUseCase({required this.repoContract});

  Future<Either<BaseError, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) async {
    var either =
        await repoContract.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repoContract: injectAuthRepo());
}
