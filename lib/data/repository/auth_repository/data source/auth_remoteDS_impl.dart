import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/api%20manager.dart';
import 'package:ecommerce/data/api/base%20error.dart';
import 'package:ecommerce/domain/entities/auth%20result%20entity.dart';

import '../../../../domain/repository/auth_repo/data source/auth_remote_DS.dart';

class AuthRemoteDSImpl implements AuthRemoteDS {
  ApiManager apiManager;

  AuthRemoteDSImpl({required this.apiManager});

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either =
        await apiManager.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }
}

AuthRemoteDS injectAuthRemoteDS() {
  return AuthRemoteDSImpl(apiManager: ApiManager.getInstance());
}
