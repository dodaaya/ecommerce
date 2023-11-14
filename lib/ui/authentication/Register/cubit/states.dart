import 'package:ecommerce/data/model/response/RegisterResponse.dart';

abstract class RegisterStates {}

class RegisterLoadingState extends RegisterStates {
  String? loadMsg;

  RegisterLoadingState({required this.loadMsg});
}

class RegisterInitialState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String? errorMsg;

  RegisterErrorState({required this.errorMsg});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponse response;

  RegisterSuccessState({required this.response});
}
