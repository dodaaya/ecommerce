import 'package:ecommerce/domain/use%20case/register%20use%20case.dart';
import 'package:ecommerce/ui/authentication/Register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;
  var nameController = TextEditingController(text: "diana");
  var phoneController = TextEditingController(text: "01156393933");
  var rePasswordController = TextEditingController(text: "1234567");
  var passwordController = TextEditingController(text: "1234567");
  var emailController = TextEditingController(text: "dtarek78@gmail.com");
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(loadMsg: 'Loading...'));

      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text);
      either.fold((l) {
        emit(RegisterErrorState(errorMsg: l.errorMessage));
      }, (response) {
        emit(RegisterSuccessState(response: response));
      });
    }
  }
}
