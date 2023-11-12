import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../myTheme.dart';
import '../utils/text field item.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: MyTheme.primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                child: Image.asset('assets/images/img_1.png'),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFieldItem(
                      fieldName: 'Full Name',
                      hintText: 'enter your full name',
                      controller: emailController,
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
                      controller: emailController,
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
                      controller: emailController,
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
                      isObsecure: isObsecure,
                      controller: passwordController,
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
                        child: isObsecure
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onTap: () {
                          if (isObsecure) {
                            isObsecure = false;
                          } else {
                            isObsecure = true;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context)
                                .pushReplacementNamed(RegisterScreen.routeName);
                          }
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)))),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
