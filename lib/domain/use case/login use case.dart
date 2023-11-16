import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/base%20error.dart';
import 'package:ecommerce/data/repository/auth_repository/repository/auth_rep_impl.dart';
import 'package:ecommerce/domain/entities/auth%20result%20entity.dart';
import 'package:ecommerce/domain/repository/auth_repo/repository/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

  Future<Either<BaseError, AuthResultEntity>> invoke(
      String email, String password) async {
    var either = await repositoryContract.login(email, password);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}
LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepo());
}