import 'package:ecommerce/domain/use%20case/login%20use%20case.dart';
import 'package:ecommerce/ui/authentication/login/cubit/login%20states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState(loadMessage: 'Loading...'));
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      return either.fold((l) {
        emit(LoginErrorState(errorMessage: l.errorMessage!));
      }, (response) {
        emit(LoginSuccessState(response: response));
      });
    }
  }
}
