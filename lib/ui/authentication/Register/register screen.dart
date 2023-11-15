import 'package:ecommerce/domain/use%20case/register%20use%20case.dart';
import 'package:ecommerce/myTheme.dart';
import 'package:ecommerce/ui/authentication/Register/cubit/register%20view%20model.dart';
import 'package:ecommerce/ui/authentication/Register/cubit/states.dart';
import 'package:ecommerce/utils/Dia;ogue_utils.dart';
import 'package:ecommerce/utils/text%20field%20item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var viewModel = RegisterViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogueUtils.showLoading(context, state.loadMsg ?? 'Loading...');
        } else if (state is RegisterErrorState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMsg(context, state.errorMsg!,
              posActionName: 'ok', title: 'error');
        } else if (state is RegisterSuccessState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMsg(context, state.response.user?.name ?? "",
              posActionName: 'ok', title: 'Success');
        }
      },
      child: Scaffold(
        body: Container(
            color: MyTheme.primaryColor,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 80.h, left: 97.w, right: 97.w),
                  child: Image.asset('assets/images/img_1.png'),
                ),
                Form(
                  key: viewModel.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFieldItem(
                          fieldName: 'Full Name',
                          hintText: 'enter your full name',
                          controller: viewModel.nameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter your name';
                            }
                            return null;
                          },
                        ),
                        TextFieldItem(
                          fieldName: 'Mobile Number',
                          hintText: 'enter your mobile number',
                          controller: viewModel.phoneController,
                          keyBoardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter your name';
                            }
                            return null;
                          },
                        ),
                        TextFieldItem(
                          fieldName: 'Email Address',
                          hintText: 'enter your email address',
                          controller: viewModel.emailController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter your email address';
                            }
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (!emailValid) {
                              return 'invalid email';
                            }
                            return null;
                          },
                        ),
                        TextFieldItem(
                          fieldName: 'Password',
                          hintText: 'enter your password',
                          isObsecure: viewModel.isObsecure,
                          controller: viewModel.passwordController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter your password';
                            }
                            if (value.trim()!.length < 6 ||
                                value.trim()!.length > 20) {
                              return 'invalid password';
                            }
                            return null;
                          },
                          suffixIcon: InkWell(
                            child: viewModel.isObsecure
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onTap: () {
                              if (viewModel.isObsecure) {
                                viewModel.isObsecure = false;
                              } else {
                                viewModel.isObsecure = true;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                        TextFieldItem(
                          fieldName: 'Confirm Password',
                          hintText: 'enter your password again',
                          isObsecure: viewModel.isObsecure,
                          controller: viewModel.rePasswordController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter your confirmation password';
                            }
                            if (value.trim()!.length < 6 ||
                                value.trim()!.length > 20) {
                              return 'wrong password';
                            }
                            return null;
                          },
                          suffixIcon: InkWell(
                            child: viewModel.isObsecure
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onTap: () {
                              if (viewModel.isObsecure) {
                                viewModel.isObsecure = false;
                              } else {
                                viewModel.isObsecure = true;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: ElevatedButton(
                            onPressed: () {
                              viewModel.register();
                            },
                            child: Container(
                              height: 64.h,
                              width: 370.w,
                              child: Center(
                                child: Text(
                                  'Sign up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: MyTheme.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.sp),
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.r)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}
