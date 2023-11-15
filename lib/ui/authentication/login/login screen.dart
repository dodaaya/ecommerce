import 'package:ecommerce/domain/use%20case/login%20use%20case.dart';
import 'package:ecommerce/myTheme.dart';
import 'package:ecommerce/ui/authentication/Register/register%20screen.dart';
import 'package:ecommerce/ui/authentication/login/cubit/login%20states.dart';
import 'package:ecommerce/ui/authentication/login/cubit/login_view_model.dart';
import 'package:ecommerce/utils/Dia;ogue_utils.dart';
import 'package:ecommerce/utils/text%20field%20item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginViewModel viewModel = LoginViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogueUtils.showLoading(context, state.loadMessage ?? 'Loading...');
        } else if (state is LoginErrorState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMsg(context, state.errorMessage!,
              posActionName: 'ok', title: 'Error');
        } else if (state is LoginSuccessState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMsg(context, state.response.token!,
              posActionName: 'ok', title: 'Success');
        }
      },
      child: Scaffold(
        body: Container(
          color: MyTheme.primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                  child: Image.asset('assets/images/img_1.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome Back To Route',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 16.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 19.w),
                  child: Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.h),
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.login();
                    },
                    child: Container(
                      height: 64.h,
                      width: 370.w,
                      child: Center(
                        child: Text(
                          'Login',
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
                            borderRadius:
                            BorderRadius.all(Radius.circular(15.r)))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account?',
                          style: Theme.of(context).textTheme.titleMedium!),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RegisterScreen.routeName);
                        },
                        child: Text(' Create Account',
                            style: Theme.of(context).textTheme.titleMedium!),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
