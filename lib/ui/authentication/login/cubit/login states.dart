import 'package:ecommerce/domain/entities/auth%20result%20entity.dart';

abstract class LoginStates {}

class LoginLoadingState extends LoginStates {
  String? loadMessage;

  LoginLoadingState({required this.loadMessage});
}

class LoginInitialState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String? errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginStates {
  AuthResultEntity response;

  LoginSuccessState({required this.response});
}
