import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/base%20error.dart';
import 'package:ecommerce/data/repository/auth_repository/data%20source/auth_remoteDS_impl.dart';
import 'package:ecommerce/domain/entities/auth%20result%20entity.dart';
import 'package:ecommerce/domain/repository/auth_repo/data%20source/auth_remote_DS.dart';
import 'package:ecommerce/domain/repository/auth_repo/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDS remoteDS;

  AuthRepositoryImpl({required this.remoteDS});

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) {
    return remoteDS.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password) {
    return remoteDS.login(email, password);
  }
}

AuthRepositoryContract injectAuthRepo() {
  return AuthRepositoryImpl(remoteDS: injectAuthRemoteDS());
}
