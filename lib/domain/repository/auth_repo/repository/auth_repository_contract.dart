import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/base%20error.dart';
import 'package:ecommerce/domain/entities/auth%20result%20entity.dart';

abstract class AuthRepositoryContract {
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone);
}
