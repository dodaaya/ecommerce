import 'package:ecommerce/domain/use%20case/register%20use%20case.dart';
import 'package:ecommerce/ui/authentication/Register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var rePasswordController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(loadMsg: 'Loading...'));
      try {
        var response = await registerUseCase.invoke(
            nameController.text,
            emailController.text,
            passwordController.text,
            rePasswordController.text,
            phoneController.text);
        if (response.message != 'success') {
          emit(RegisterErrorState(errorMsg: response.message!));
        } else {
          emit(RegisterSuccessState(response: response));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMsg: e.toString()));
      }
    }
  }
}
